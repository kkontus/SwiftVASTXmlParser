//
//  ExadsSDK.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 24/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

class ExadsSDK {
    
    static func getVAST(_ delegate: ResponseObserver, params: [String : String]) {
        let action = ActionGetVAST()
        action.delegate = delegate
        action.getVAST(params)
    }
    
}
