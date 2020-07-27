//
//  RxSwiftValidationViewController.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/20.
//  Copyright © 2020 rjb. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class RxSwiftValidationViewController: UIViewController {
    let topSafe = 64
    var usernameTextField = UITextField()
    var usernameLabel = UILabel()
    var passwordTextField = UITextField()
    var passwordLabel = UILabel()
    var doButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        //map 是高级函数
        //map 后面实际行是个闭包
        //默认是返回值
        //取参数$0
        //返回值都用一个observer进行包装。所以能进行链式调用
        let disposeBag = DisposeBag()
        
        //usernameTextField的变化。会生成一个被observal包装的值
        let usernameValid = usernameTextField.rx.text.orEmpty.map {
            $0.count >= 5
        }.share(replay: 1, scope: SubjectLifetimeScope.forever)
        
        //将这个值绑定到视图
        usernameValid.bind(to: passwordTextField.rx.isEnabled).disposed(by: disposeBag)
        
    }
    
    func process() {
        funRepo("raojunbo").subscribe(onSuccess: { (json) in
            print("json",json)
        }, onError: {
            (error) in
            print("error",error)
        }).disposed(by: DisposeBag())
    }
    
    //具有单一功能的rxswift
    func funRepo(_ repo:String) -> Single<[String:Any]> {
        return Single<[String:Any]>.create { (single) -> Disposable in
            let url = URL(string: "https://api.github.com/repos/\(repo)")!
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    single(.error(error))
                    return
                }
            }
            
            single(.success(["key":""]))
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    
    func makeUI()  {
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(usernameTextField)
        self.view.addSubview(usernameLabel)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(doButton)
        usernameTextField.placeholder = "我是usename"
        usernameTextField.backgroundColor = UIColor.lightGray
        
        usernameLabel.text = "UserName"
        
        passwordTextField.placeholder = "我是密码"
        passwordTextField.backgroundColor = UIColor.lightGray
        
        passwordLabel.text = "Password"
        
        doButton.setTitle("do some", for: UIControl.State.normal)
        
        usernameLabel.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
        
        usernameTextField.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.top.equalTo(usernameLabel.snp_bottom).offset(10)
        }
        
        passwordLabel.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.top.equalTo(usernameTextField.snp_bottom).offset(10)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.top.equalTo(passwordLabel.snp_bottom).offset(10)
        }
        
        doButton.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
            make.top.equalTo(passwordTextField.snp_bottom).offset(10)
        }
    }
}
