//
//  AuthController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import AddressBook

class AuthController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        var table = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64), style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
     
    }
    
    //MARK: - tableview代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoCell")
            if cell == nil {
                cell = BasicInfoCell(style: .default, reuseIdentifier: "BasicInfoCell")
            }
            return cell!
            
        default:
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            switch indexPath.row {
            case 0:
                cell?.imageView?.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
                cell?.textLabel?.text = "芝麻信用分"
                break
            case 1:
                cell?.imageView?.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
                cell?.textLabel?.text = "信用卡账单"
                break
            case 2:
                cell?.imageView?.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
                cell?.textLabel?.text = "手机通讯录"
                break
            default:
                cell?.imageView?.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
                cell?.textLabel?.text = "京东白条"
                break
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(UIViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(UIViewController(), animated: true)
        case 2:
            queryABAuth()
        case 3:
            navigationController?.pushViewController(JDAuthVC(), animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
            let leftImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
            leftImage.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
            header.addSubview(leftImage)
            let title = UILabel(frame: CGRect(x: 40, y: 0, width: 200, height: 40))
            title.text = "基本信息(必填)"
            header.addSubview(title)
            return header
        default:
            let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
            let leftImage = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
            leftImage.image = #imageLiteral(resourceName: "tabbar_home_highlighted")
            header.addSubview(leftImage)
            let title = UILabel(frame: CGRect(x: 40, y: 0, width: 200, height: 40))
            title.text = "其它信息(选填)"
            header.addSubview(title)
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UIScreen.main.bounds.width / 4.0
        default:
            return 44
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    //私有方法
    func queryABAuth() -> Void {
        let status = ABAddressBookGetAuthorizationStatus()
        if status == .notDetermined {
            let abRef = ABAddressBookCreate()
            
            ABAddressBookRequestAccessWithCompletion(abRef as ABAddressBook, { (result, nil) in
                if result {
                    print("成功")
                }else{
                    print("失败")
                }
            })
            
            return
        }
        
    }
}
