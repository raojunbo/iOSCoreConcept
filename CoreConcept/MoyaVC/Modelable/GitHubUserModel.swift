//
//  GitHubUserModel.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/19.
//  Copyright © 2020 rjb. All rights reserved.
//

import Foundation
import SwiftyJSON
import MoyaMapper

//   {
//      "login": "raojunbo",
//      "id": 5660945,
//      "node_id": "MDQ6VXNlcjU2NjA5NDU=",
//      "avatar_url": "https://avatars1.githubusercontent.com/u/5660945?v=4",
//      "gravatar_id": "",
//      "url": "https://api.github.com/users/raojunbo",
//      "html_url": "https://github.com/raojunbo",
//      "followers_url": "https://api.github.com/users/raojunbo/followers",
//      "following_url": "https://api.github.com/users/raojunbo/following{/other_user}",
//      "gists_url": "https://api.github.com/users/raojunbo/gists{/gist_id}",
//      "starred_url": "https://api.github.com/users/raojunbo/starred{/owner}{/repo}",
//      "subscriptions_url": "https://api.github.com/users/raojunbo/subscriptions",
//      "organizations_url": "https://api.github.com/users/raojunbo/orgs",
//      "repos_url": "https://api.github.com/users/raojunbo/repos",
//      "events_url": "https://api.github.com/users/raojunbo/events{/privacy}",
//      "received_events_url": "https://api.github.com/users/raojunbo/received_events",
//      "type": "User",
//      "site_admin": false,
//      "name": null,
//      "company": "Ink Weather",
//      "blog": "https://raojunbo.github.io/",
//      "location": "Beijing",
//      "email": null,
//      "hireable": null,
//      "bio": "I`m a iOS developer.",
//      "twitter_username": null,
//      "public_repos": 31,
//      "public_gists": 0,
//      "followers": 0,
//      "following": 2,
//      "created_at": "2013-10-11T02:36:57Z",
//      "updated_at": "2020-07-15T09:33:53Z"
//    }

struct GitUserModel:Modelable {
    var login = ""
    var id = ""
    var node_id = ""
    var avatar_url = ""
    var gravatar_id = ""
    var url = ""
    var html_url = ""
    var followers_url = ""
    
    init() {
           
    }
    
    mutating func mapping(_ json: JSON) {
    //如果健值需要自定义银色
//        self.login = json["login"].stringValue
//        self.id = json["id"].stringValue
    }
    
}
