//
//  Tracking.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class Tracking: EVObject {
    var event: String?
    var offset: String?
    var __text: String?
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "_event":
            if let object = value as? String {
                self.event = object
            }
        case "_offset":
            if let object = value as? String {
                self.offset = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
}
