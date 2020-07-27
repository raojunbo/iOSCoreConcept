//
//  RxSwiftTest2ViewController.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/23.
//  Copyright © 2020 rjb. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RxSwiftTest2ViewController: UIViewController,UITableViewDelegate {
    let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: UITableView.Style.plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建数据源。并将序列化
        let items = Observable.just([
            SectionModel(model: "First Section", items: [
                1.0,
                2.0,
                3.0
            ]),
            SectionModel(model: "Second Section", items: [
                3.0,
                4.0,
                5.0
            ])
        ])
        
        //观察者
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,Double>>(
        configureCell: {
            section,tv,index,item in
            let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = "\(index.row)"
            return cell
        },
        titleForHeaderInSection: { dataSource,sectionIndex in
            return dataSource[sectionIndex].model
        })

        
        //给数据源Observable化，然后给其添加观察者
        items.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: DisposeBag())
        
        //选择所产生的序列，经过处理
        tableView.rx.itemSelected.map {
            indexPath in
            return (indexPath,dataSource[indexPath])
        }.subscribe { (sectionModel) in
            
        }.disposed(by:  DisposeBag())
    }
    
}
