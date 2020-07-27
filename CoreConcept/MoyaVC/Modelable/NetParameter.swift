//
//  NetParameter.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/19.
//  Copyright © 2020 rjb. All rights reserved.
//

import Foundation
import MoyaMapper

// statusCodeKey、tipStrKey、 modelKey 可以任意指定级别的路径，如： "error>used"

struct NetParameter : ModelableParameterType {
//    var successValue = "000"
//    var statusCodeKey = "retStatus"
//    var tipStrKey = "retMsg"
//    var modelKey = "retBody"
    //统一处理的key值
    //若过没有。可以不写
    public var successValue: String = ""
    public var statusCodeKey: String = ""
    public var tipStrKey: String = ""
    public var modelKey: String = ""
}
