//
//  RxSwiftTestViewController.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/16.
//  Copyright © 2020 rjb. All rights reserved.
//

import UIKit
import Moya

//使用swift
class SwiftTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - 64), style: UITableView.Style.plain)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Swift"
        self.view.addSubview(self.tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        var cellTitleStr: String?
        if(indexPath.row == 0){
            cellTitleStr = String(indexPath.row) + ":Swift调Swift网络请求"
        }else if(indexPath.row == 1){
            cellTitleStr = String(indexPath.row) + ":Native调Swift网络示例"
        }else if(indexPath.row == 2){
            cellTitleStr = String(indexPath.row) + ":RxSwift的网络示例"
        }
        cell?.textLabel?.text = cellTitleStr
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let request1VC = PureSwiftRequestViewController()
            self.navigationController?.pushViewController(request1VC, animated: true)
        }else if(indexPath.row == 1){
            let navtiveVC: NativeViewController = NativeViewController()
            self.navigationController?.pushViewController(navtiveVC, animated: true)
        }else if(indexPath.row == 2){
            let navtiveVC: RxSwiftTestViewController = RxSwiftTestViewController()
            self.navigationController?.pushViewController(navtiveVC, animated: true)
        }
    }
    
}
