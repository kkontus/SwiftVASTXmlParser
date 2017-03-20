//
//  Creative.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class Creative: EVObject {
    var sequence: String?
    var id: String?
    var linear = Linear()
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "_sequence":
            if let object = value as? String {
                self.sequence = object
            }
        case "_id":
            if let object = value as? String {
                self.id = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
}
