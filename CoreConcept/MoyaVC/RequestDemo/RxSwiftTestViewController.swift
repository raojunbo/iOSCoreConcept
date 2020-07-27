//
//  SwiftTestViewController.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/17.
//  Copyright © 2020 rjb. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//rxSwift
//写一个相互调用
//网络请求公用
//网络请求使用示例
//网络请求取消
//网络统一处理

class RxSwiftTestViewController: UIViewController, UITableViewDelegate {
    var viewModel: RxSwiftTestViewModel?
    lazy var nativeButton: UIButton = {
        let refreshButton =  UIButton(type: UIButton.ButtonType.custom)
        refreshButton.frame = CGRect(x: 0, y: 64 + 40, width: 100, height: 50)
        refreshButton.backgroundColor = UIColor.red
        refreshButton.setTitle("Native", for: UIControl.State.normal)
        return refreshButton
    }()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: CGRect(x: 0, y: 64 + 40 + 50, width: 300, height:400), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "RXSwift"
        
        self.view.addSubview(self.nativeButton)
        self.view.addSubview(self.tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let disposeBag = DisposeBag()
        
        //button
        self.nativeButton.rx.tap.subscribe(onNext: {
            print("button tapped")
        }).disposed(by: disposeBag)
        
        let items = Observable.just(
            (0..<20).map { "\($0)" }
        )
        
        //原理
        
        items.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
            print("\(row)")
            cell.textLabel?.text = "\(element) @ row \(row)"
            cell.textLabel?.textColor = UIColor.red
            cell.backgroundColor  = UIColor.green
        }
        .disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(String.self)
            .subscribe(onNext:  { value in
                
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                
            })
            .disposed(by: disposeBag)
    }
    
    func bindViewMode() {
        viewModel = RxSwiftTestViewModel()
    }
    
    @objc func nativeButtonClick() {
        
    }
}
