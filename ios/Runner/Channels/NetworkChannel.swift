//
//  NetworkChannel.swift
//  Runner
//
//  Created by Erik Zier on 22/02/2020.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import Alamofire

private let channelName = "izerik.dev/network"

class NetworkChannel {
    private let session: Session
    private let methodChannel: FlutterMethodChannel
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        let manager = CustomServerTrustManager(evaluators: [:])
        
        session = Session(configuration: URLSessionConfiguration.af.default, delegate: SessionDelegate(), rootQueue: DispatchQueue(label: "org.alamofire.session.rootQueue"), serverTrustManager: manager)
        
        methodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: binaryMessenger)
        
        setupChannel()
    }
    
    private func setupChannel() {
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else { return }
            
            print(">> host >> \(call.method) \(call.arguments)")
            
            if call.method == "get" || call.method == "post" || call.method == "getImage" {
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
                
                if call.method == "getImage" {
                    dataRequest.responseData { response in
                        switch response.result {
                        case .success(let data):
                            let payloadData = FlutterStandardTypedData(bytes: data)
                            let payload: [String: Any] = ["status": "success", "result": payloadData]
                            result(payload)
                        case .failure(let error):
                            let payload = ["status": "failure", "error": error.errorDescription]
                            result(payload)
                        }
                    }
                } else {
                    dataRequest.responseString { response in
                        switch response.result {
                        case .success(let data):
                            let payload = ["status": "success", "result": data]
                            result(payload)
                        case .failure(let error):
                            let payload = ["status": "failure", "error": error.errorDescription]
                            result(payload)
                        }
                    }
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
}

final class CustomServerTrustManager: ServerTrustManager {
    
    override public func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
//        return DisabledEvaluator()
        
        return DefaultTrustEvaluator(validateHost: false)
    }
}
