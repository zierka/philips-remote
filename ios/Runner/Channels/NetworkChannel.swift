//
//  NetworkChannel.swift
//  Runner
//
//  Created by Erik Zier on 22/02/2020.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import Alamofire

class NetworkChannel: NetworkChannelApiRequest {
    
    private let session: Session    
    private let responseChannel: NetworkChannelApiResponse
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        let manager = CustomServerTrustManager(evaluators: [:])
        
        session = Session(configuration: URLSessionConfiguration.af.default, delegate: SessionDelegate(), rootQueue: DispatchQueue(label: "org.alamofire.session.rootQueue"), serverTrustManager: manager)

        responseChannel = NetworkChannelApiResponse(binaryMessenger: binaryMessenger)
        
        NetworkChannelApiRequestSetup(binaryMessenger, self)
    }
    
    func send(_ input: ChannelRequest, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        
        guard let method = input.method else { return }
        guard method == "get" || method == "post" else { return }
        
        guard let payload = input.payload else { return }
        guard let url = payload.url else { return }
        
        let httpMethod = HTTPMethod(rawValue: method.uppercased())
        
        var request = try! URLRequest(url: url, method: httpMethod)
            
        if let options = input.options {
            if let timeout = options.timeout {
                request.timeoutInterval = timeout.doubleValue
            }
        }
        
        switch httpMethod {
        case .get:
            break
        case .post:
            if let body = payload.body {
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
        
        if let credential = payload.credential,
            let user = credential.username, user != "",
            let pass = credential.password, pass != ""
        {
            dataRequest = dataRequest.authenticate(username: user, password: pass)
        }
        
        let channelResponse = ChannelResponse()
        channelResponse.request = input;
        
        dataRequest.validate(statusCode: 200..<300).responseData { response in
            switch response.result {
            case .success(let data):
                let payloadData = FlutterStandardTypedData(bytes: data)
        
                channelResponse.result = payloadData
                
                self.responseChannel.onResult(channelResponse) { (error) in
                    print("error")
                }
                
            case .failure(let error):
                if case .responseSerializationFailed(let reason) = error, case .inputDataNilOrZeroLength = reason {
                    let payloadData = FlutterStandardTypedData(bytes: Data())
                        
                    channelResponse.result = payloadData
                    
                    self.responseChannel.onResult(channelResponse) { (error) in
                        print("error")
                    }
                } else {
                    let _error = NetworkError()
                    _error.error = String(describing: error)
                    let code = response.response?.statusCode ?? -1
                    _error.code = NSNumber(value: code)
                    
                    channelResponse.error = _error
                    
                    self.responseChannel.onResult(channelResponse) { (error) in
                        print("error")
                    }
                }
            }
        }
    }
}

// MARK: - ServerTrustManager

final class CustomServerTrustManager: ServerTrustManager {
    
    override public func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
//        if host.contains("8008") {
//            return DefaultTrustEvaluator()
//        } else {
            return DisabledTrustEvaluator()
//        }
        
//        return DefaultTrustEvaluator(validateHost: false)
    }
}
