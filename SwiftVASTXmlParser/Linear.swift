//
//  Linear.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class Linear: EVObject {
    var skipoffset: String?
    var duration: String?
    var trackingEvents = TrackingEvents()
    var videoClicks = VideoClicks()
    var mediaFiles = MediaFiles()
    
    override func setValue(_ value: Any!, forUndefinedKey key: String) {
        switch key {
        case "_skipoffset":
            if let object = value as? String {
                self.skipoffset = object
            }
        default:
            self.addStatusMessage(.IncorrectKey, message: "SetValue in '\(type(of: self))' for key '\(key)' should be handled.")
            print("---> setValue in '\(type(of: self))' for key '\(key)' should be handled.")
        }
    }
    
}
