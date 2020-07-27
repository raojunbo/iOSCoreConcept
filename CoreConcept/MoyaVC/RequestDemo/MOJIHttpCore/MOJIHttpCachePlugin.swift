//
//  MOJIHttpCachePlugin.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/24.
//  Copyright © 2020 rjb. All rights reserved.
//

//转门为Moya做的HTTP缓存

import Foundation
import Moya
import Result

//缓存
public final class MOJIHttpCachePlugin : PluginType{
    // MARK: Plugin
    
    /// Called by the provider as soon as the request is about to start
    public func willSend(_ request: RequestType, target: TargetType) {
        print("发出请求了")
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }
    /// Called by the provider as soon as a response arrives, even if the request is canceled.
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        print("收到数据了")
    }
    
    public func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
        print("处理数据了")
        return result
    }
}
