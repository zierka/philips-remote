//
//  NetworkChannel.swift
//  Runner
//
//  Created by Erik Zier on 22/02/2020.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import Alamofire

class NetworkChannel {
    private let session: Session
    private let methodChannel: FlutterMethodChannel
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        let manager = CustomServerTrustManager(evaluators: [:])
        
        session = Session(configuration: URLSessionConfiguration.af.default, delegate: SessionDelegate(), rootQueue: DispatchQueue(label: "org.alamofire.session.rootQueue"), serverTrustManager: manager)
        
        methodChannel = FlutterMethodChannel(name: "izerik.dev/network", binaryMessenger: binaryMessenger)
        
        setupChannel()
    }
    
    private func setupChannel() {
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else { return }
            
            print(">> host >> \(call.method) \(call.arguments)")
            
            if call.method == "get" || call.method == "post" {
                let method = HTTPMethod(rawValue: call.method.uppercased())
            
                let payload = call.arguments as! [String:Any]
                
                let url = payload["url"] as! String
                var request = try! URLRequest(url: url, method: method)
                
                switch method {
                case .get:
                    break
                case .post:
                    if let body = payload["body"] as? String {
                        request.httpBody = body.data(using: .utf8)
                    }
                default:
                    break
                }
                
                // status [failure], error, result
                
                var dataRequest = self.session.request(request)
                
                if let user = UserDefaults.standard.string(forKey: "flutter.user"),
                    let pass = UserDefaults.standard.string(forKey: "flutter.pass") {
                
                    dataRequest = dataRequest.authenticate(username: user, password: pass)
                }
                
                dataRequest.responseString { response in
                    print(">> Response: \(response)")
                    
                    switch response.result {
                    case .success(let data):
                        let payload = ["status": "success", "result": data]
                        result(payload)
                    case .failure(let error):
                        let payload = ["status": "failure", "error": error.errorDescription]
                        result(payload)
                    }
                }
            } else {
                result(FlutterMethodNotImplemented)
                return
            }
        }
    }
}

class API {
    static let protocol1 = "https://";
    static let port = 1926;
    static let apiVersion = "6";
    static var ip: String { UserDefaults.standard.string(forKey: "flutter.ip") ?? "" }
    
    static var baseUrl: String { protocol1 + ip + ":" + String(port) + "/" + apiVersion + "/" }
}

final class CustomServerTrustManager: ServerTrustManager {
    
    override public func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
//        return DisabledEvaluator()
        
        return DefaultTrustEvaluator(validateHost: false)
    }
}
