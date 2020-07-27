//
//  PureSwiftRequestViewController.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/24.
//  Copyright © 2020 rjb. All rights reserved.
//

import UIKit
import SwiftyJSON

class PureSwiftRequestViewController: UIViewController {
    lazy var button: UIButton =  {
        let button =  UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: 64 + 40, width: 100, height: 50)
        button.setTitle("我是button", for: UIControl.State.normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(requestOCAPI), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    var cancleObject:MOJIHttpCancelableToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(button)
    }
    
   @objc func requestOCAPI()  {
        let ocCancleObject = UserCenterHttpInterface.requtstUserProfile(userName: "raojunbo") { (result) in
            print(result)
        }
        cancleObject =  ocCancleObject
    }
    
    deinit {
        cancleObject?.cancel()
    }
}


