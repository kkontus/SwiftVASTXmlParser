//
//  Extensions.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 27/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class Extensions: EVObject {
    // var `extension`: [String] = [] // we need backticks because `extension` is a Swift keyword or use code below as for custom keys
    var extensionMapped: [String] = []
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "Extension":
            if let object = value as? [String] {
                self.extensionMapped = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
}
