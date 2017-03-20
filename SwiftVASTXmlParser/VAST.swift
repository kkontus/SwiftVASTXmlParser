//
//  VAST.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class VAST: EVObject {
    var __name: String?
    var version: String?
    var ad = Ad()
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "_version":
            if let object = value as? String {
                self.version = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
}
