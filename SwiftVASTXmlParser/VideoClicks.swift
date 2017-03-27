//
//  VideoClicks.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Foundation
import EVReflection

class VideoClicks: EVObject {
    var clickThrough: String?
    var clickTracking: [String] = []
    var customClick: [String] = []
}
