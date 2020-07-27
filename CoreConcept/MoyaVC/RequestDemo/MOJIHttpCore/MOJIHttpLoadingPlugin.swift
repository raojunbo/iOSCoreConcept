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

var SwiftIsShowHud:Bool = true

public final class MOJIHttpLoadingPlugin:PluginType{
   
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
            print("prepare")
            var mRequest = request
            mRequest.timeoutInterval = 20
            return mRequest
        }
    
    public func willSend(_ request: RequestType, target: TargetType) {
            print("开始请求")
            SwiftIsShowHud = true
            if SwiftIsShowHud == true {
                let keyViewController = UIApplication.shared.keyWindow?.rootViewController
                if (keyViewController != nil) {
                    MBProgressHUD.showAdded(to: keyViewController!.view, animated: true)
                }
            }
            
        }
        
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
            print("结束请求")
//            SwiftIsShowHud = false
            let keyViewController = UIApplication.shared.keyWindow?.rootViewController
            if (keyViewController != nil) {
                MBProgressHUD.hide(for: keyViewController!.view, animated: true)
            }
            
            
           guard case Result.failure(_) = result
            else {
                let respons = result.value
                let dic: Dictionary<String, Any>? =
                    try? JSONSerialization.jsonObject(with: respons!.data, options: .mutableContainers) as! Dictionary<String, Any>
                
                if dic != nil {
                    if dic?.keys.contains("status") == true {
                        if dic?["status"] as! Int == 11 || dic?["status"] as! Int == 12 {
                            print("Token 失效")
                        }
                    }
                    
                    if dic?.keys.contains("code") == true {
                        if dic?["code"] as! Int == 11 || dic?["code"] as! Int == 12 {
                            print("Token 失效")
                        }
                    }
                }
                return
            }
            let errorReason: String = (result.error?.errorDescription)!
            print("请求失败：\(errorReason)")
            var tip = ""
            if errorReason.contains("The Internet connection appears to be offline") {
                tip = "网络不给力，请检查您的网络"
            }else if errorReason.contains("Could not connect to the server") {
                tip = "无法连接服务器"
            }else {
               tip = "请求失败"
            }
            /// 使用tip文字 进行提示
        }
}

