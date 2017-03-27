//
//  InLine.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class InLine: EVObject {
    var adSystem: String?
    var adTitle: String?
    var error: String?
    var creatives = Creatives()
    var advertiser: String?
    var pricing: String?
    var survey: String?
    var impression: [String] = []
    var extensions = Extensions()
    var descriptionMapped: String?
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "Description":
            if let object = value as? String {
                self.descriptionMapped = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
}
