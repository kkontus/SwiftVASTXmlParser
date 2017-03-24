//
//  ResponseObserver.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 24/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Alamofire

protocol ResponseObserver {
    
    func onError(_ error: Error, calledBy: String)
    
    func onError(_ statusCode: Int, calledBy: String)
    func onError(_ statusCode: Int)
    func onError(_ text: String)
    
    func onSuccess(_ statusCode: Int, calledBy: String)
    func onSuccess(_ statusCode: Int)
    func onSuccess(_ text: String)
    
    func onSuccess(_ xmlData: Data)
    
}

extension ResponseObserver {
    
    func onError(_ error: Error, calledBy: String) {
        
    }
    
    func onError(_ statusCode: Int, calledBy: String) {
        
    }
    
    func onError(_ statusCode: Int) {
        
    }
    
    func onError(_ text: String) {
        
    }
    
    func onSuccess(_ statusCode: Int, calledBy: String) {
        
    }
    
    func onSuccess(_ statusCode: Int) {
        
    }
    
    func onSuccess(_ text: String) {
        
    }
    
    func onSuccess(_ xmlData: Data) {
        
    }
    
}
