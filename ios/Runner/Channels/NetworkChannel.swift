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
                
                /*
                 status: success/failure
                 reault: response body/error code
                 */
                 
                var dataRequest = self.session.request(request)
                
                if let credential = payload["credential"] as? [String: String],
                    let user = credential["username"],
                    let pass = credential["password"] {
                    
                    dataRequest = dataRequest.authenticate(username: user, password: pass)
                }
                
                dataRequest.validate(statusCode: 200..<300).responseData { response in
                    switch response.result {
                    case .success(let data):
                        let payloadData = FlutterStandardTypedData(bytes: data)
                        let payload: [String: Any] = ["status": "success", "result": payloadData]
                        result(payload)
                    case .failure(let error):
                        if case .responseSerializationFailed(let reason) = error, case .inputDataNilOrZeroLength = reason {
                            let payloadData = FlutterStandardTypedData(bytes: Data())
                            let payload: [String: Any] = ["status": "success", "result": payloadData]
                            result(payload)
                        } else {
                            let code = response.response?.statusCode ?? -1
                            let payload: [String : Any] = ["status": "failure", "error": code]
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
