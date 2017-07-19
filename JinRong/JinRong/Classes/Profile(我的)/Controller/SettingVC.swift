//
//  SettingVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class SettingVC: BaseController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    func setupUI() -> Void {
        title = "设置"
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(0)
        }
    }
    
    //MARK: - table代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "密码管理"
        case 1:
            cell?.textLabel?.text = "帐号管理"
        case 2:
            cell?.textLabel?.text = "意见反馈"
        case 3:
            cell?.textLabel?.text = "关于"
        default :
            break
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    //MARK: - 懒加载
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
}
