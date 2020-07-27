//
//  MOJIMoyaRequestPreHandlingPlugin.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/27.
//  Copyright © 2020 rjb. All rights reserved.
//

import Foundation
import Moya
import Result

/**
 1. 公共参数设置
 2. 公共Header设置
 */
public final class MOJIHttpRequestPrePlugin:PluginType{
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutateableRequest = request
        return mutateableRequest.appendCommonParams();
    }
}

extension URLRequest {
    
    /// global common params
    private var commonParams: [String: Any] {
        return [
            "uid":"123456",
            "identifier":"identifier",
            "net":"net",
            "snsid":"snsid"
        ]
    }
    
    /// global common header fields
    private var commonHeaderFields: [String : String] {
        return ["header":"header"]
    }
    
    mutating func appendCommonParams() -> URLRequest {
        let newHeaderFields = (allHTTPHeaderFields ?? [:]).merging(commonHeaderFields) { (current, _) in current }
        allHTTPHeaderFields = newHeaderFields
        let request = try? encoded(parameters: commonParams, parameterEncoding: URLEncoding(destination: .queryString))
        assert(request != nil, "append common params failed, please check common params value")
        return request!
    }
    
    func encoded(parameters: [String: Any], parameterEncoding: ParameterEncoding) throws -> URLRequest {
        do {
            return try parameterEncoding.encode(self, with: parameters)
        } catch {
            throw MoyaError.parameterEncoding(error)
        }
    }
}
