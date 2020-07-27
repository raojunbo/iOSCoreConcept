//
//  GitHubAPI.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/16.
//  Copyright © 2020 rjb. All rights reserved.
//

import Foundation
import Moya
import MoyaMapper

public enum UserCenterAPI {
    case UserProfile(String)
    case UserEvents(String)
    case userRepositories(String)
}

extension UserCenterAPI: TargetType {
    public var headers: [String : String]? {
        return nil
    }
    
    //相同baseURL最好采用相同的服务
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    //本身是一个枚举
    //知道了是枚举类型。就可以用.语法
    public var path: String {
        switch self {
        case .UserProfile(let name):
            return "/users/\(name.urlEscaped)"
        case .UserEvents(let name):
            return "/users/\(name.urlEscaped)/events"
        case .userRepositories(let name):
            return "/users/\(name.urlEscaped)/repos"
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Task {
        switch self {
        case .userRepositories:
            return .requestParameters(parameters: ["sort":"pushed"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .UserProfile(let name):
            return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!
        case .UserEvents(let name):
            return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!
        case .userRepositories(let name):
            return "[{\"name\": \"\(name)\"}]".data(using: String.Encoding.utf8)!
        }
    }
}

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
