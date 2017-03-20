//
//  MediaFile.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class MediaFile: EVObject {
    var delivery: String?
    var type: String?
    var __text: String?
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "_delivery":
            if let object = value as? String {
                self.delivery = object
            }
        case "_type":
            if let object = value as? String {
                self.type = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
}
