//
//  BankCardVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/18.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BankCardVC: BaseController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
        view.addSubview(tableView)
        
        
        layoutSubviews()
    }
    
    
    
    //MARK: - tableview代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BankCardCell
        if cell == nil {
            cell = BankCardCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.bankIcon.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
        cell?.bankName.text = "中国银行"
        cell?.cardNum.text = "621691***9002"
        cell?.stateImage.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    //布局方法
    func layoutSubviews() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(0)
        }
    }
    
    //MARK: - 自定义方法
    func setupConfig() -> Void {
        title = "我的银行卡"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add.png").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(BankCardVC.rightItemClick))
    }
    
    func rightItemClick() -> Void {
        navigationController?.pushViewController(BaseController(), animated: true)
    }
    
    //MARK: - 懒加载
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableViewAutomaticDimension
        table.estimatedRowHeight = 40
        return table
    }()
}
