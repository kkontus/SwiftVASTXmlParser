//
//  ActionGetVASTtag.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 24/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Alamofire

class ActionGetVAST {
    private let url = URLHelper.getVASTUrl
    var delegate: ResponseObserver?
    private let manager = NetworkConnection.sharedManager.manager
    
    func getVAST(_ params: [String : String]) {
        let headers = NetworkConnection.addUserAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:52.0) Gecko/20100101 Firefox/52.0")
        // URLCache.shared.removeAllCachedResponses()
        
        manager?.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseData { response in
            if let responseCode = response.response?.statusCode {
                switch responseCode {
                case 200:
                    if let XMLdata = response.result.value {
                        self.delegate?.onSuccess(XMLdata)
                    }
                default:
                    let className = String(describing: type(of: self))
                    let statusCode = (response.response?.statusCode)!
                    self.delegate?.onSuccess(statusCode, calledBy: className)
                }
            } else if let error = response.result.error {
                let className = String(describing: type(of: self))
                self.delegate?.onError(error, calledBy: className)
            }
        }
    }
    
}
