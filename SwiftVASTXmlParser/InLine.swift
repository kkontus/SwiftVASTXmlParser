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
}
