//
//  LiveAPI.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/19.
//  Copyright © 2020 rjb. All rights reserved.
//

// 模块
import Foundation
import Moya

public enum LiveHttpAPI {
    case RepoInfo(String, String)
}

extension LiveHttpAPI: TargetType {
    public var headers: [String : String]? {
        return nil
    }
    
    //相同baseURL最好采用相同的服务
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    public var path: String {
        //本身是一个枚举
        //知道了是枚举类型。就可以用.语法
        switch self {
        case .RepoInfo(let userName,let repoName):
            return "/repos/\(userName)/\(repoName)";
        }
    }
    
    
    public var method: Moya.Method {
        .get
    }
    
    //为每个请求设置参数
    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        return "{\"id\": 100}".data(using: String.Encoding.utf8)!
    }
}
