//
//  MOJIMoyaConfigure.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/27.
//  Copyright © 2020 rjb. All rights reserved.
//

import Foundation
import Moya
import MoyaMapper

/**
 GitHubUserInterface-->MOJIHttpProvider-->UserCenterAPI-->request
 */

public typealias OCCompletion = (_ result:String) -> Void

class MOJIHttpCancelableToken:NSObject {
    var cancelInternalObject:Cancellable
    
    init(internalObject:Cancellable) {
        cancelInternalObject = internalObject
    }
    var isCancelled = false
    
    @objc func cancel() {
        cancelInternalObject.cancel()
    }
}

class MOJIHttpProvider {
    //公参
    //公共头部
    //返回数据处理
    //缓存
    //loading插件
    //错误插件
    //oc与swift请求取消
    //oc与swift调用
    //网络请求依赖；（暂时无）
    //网络优先级：（想办法打到session里）
    
    //整个架构,都是起始于MOJIHttpProvider。
    
    static let sharedInstance = MOJIHttpProvider()
    
    let mapperPlugin = MoyaMapperPlugin(NetParameter())
    let commanRequestPrePlugin = MOJIHttpRequestPrePlugin()
    let httpCachePlugin = MOJIHttpCachePlugin()
    let httpLoadingPlugin = MOJIHttpLoadingPlugin()
    
    var multiRequestProvider:MoyaProvider<MultiTarget>?
    
    init() {
        multiRequestProvider = MoyaProvider<MultiTarget>(plugins: [
            commanRequestPrePlugin,
            httpCachePlugin,
            httpLoadingPlugin
        ])
    }
    
    static func request(targetType:TargetType,completion:@escaping Moya.Completion) -> MOJIHttpCancelableToken{
        let cancelToken =  MOJIHttpProvider.sharedInstance.multiRequestProvider?.request(MultiTarget(targetType), completion:completion)
        return MOJIHttpCancelableToken(internalObject: cancelToken!)
    }
}
