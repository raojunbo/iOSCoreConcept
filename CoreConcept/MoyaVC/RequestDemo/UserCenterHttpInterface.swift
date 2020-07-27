//
//  UserCenterAPIOC.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/24.
//  Copyright © 2020 rjb. All rights reserved.
//

import Foundation

extension  UserCenterHttpInterface {
    func handelError()  {
        
    }
}

class UserCenterHttpInterface: NSObject {
    
    @objc static  func requtstUserProfile (userName:String,complete:OCCompletion?) -> MOJIHttpCancelableToken {
        return  MOJIHttpProvider.request(targetType: UserCenterAPI.UserProfile(userName)){ (result) in
            switch result {
            case let .success(moyaResponse):
                //do {
                //let model =  moyaResponse.mapObject(GitUserModel.self)
                print(moyaResponse.toJSON())
                break
            case let .failure(error):
                print(error)
                break
            }
        }
    }
    
    @objc static func requestUserEvents(userName:String) -> MOJIHttpCancelableToken {
        return MOJIHttpProvider.request(targetType:UserCenterAPI.UserEvents(userName)) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    let model =  moyaResponse.mapObject(GitUserModel.self)
                    print(model.toJSON())
                    //不规整的数据格式，自己解析
                    try print(moyaResponse.mapString())
                } catch {
                    
                }
                break
                
            case let .failure(error):
                print(error)
                break
            }
        }
    }
}
