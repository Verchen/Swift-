//
//  ProfileController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ProfileController: BaseController, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
        view.addSubview(tableView)
        setupLayout()
        
        requestUserInfo()
    }
    
    //MARK: - tableview代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        switch indexPath.row {
        case 0:
            cell?.imageView?.image = #imageLiteral(resourceName: "backpack.png")
            cell?.textLabel?.text = "我的信息"
        case 1:
            cell?.imageView?.image = #imageLiteral(resourceName: "backpack.png")
            cell?.textLabel?.text = "账单查询"
        case 2:
            cell?.imageView?.image = #imageLiteral(resourceName: "password_icon.png")
            cell?.textLabel?.text = "修改密码"
        case 3:
            cell?.imageView?.image = #imageLiteral(resourceName: "password_icon.png")
            cell?.textLabel?.text = "我的银行卡"
        case 4:
            cell?.imageView?.image = #imageLiteral(resourceName: "wo_set.png")
            cell?.textLabel?.text = "设置"
        default: break
            
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print(indexPath.row)
        case 1:
            print(indexPath.row)
        case 2:
            navigationController?.pushViewController(UpdatePasswordVC(), animated: true)
        default:
            print(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        header.backgroundColor = UIColor.white
        
        let background = UIView()
        background.backgroundColor = UIColor.theme
        header.addSubview(background)
        background.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(80)
        }
        
        let avator = UIImageView(frame: CGRect.init(x: 20, y: 20, width: 80, height: 80))
        avator.layer.cornerRadius = 40
        avator.clipsToBounds = true
        avator.image = #imageLiteral(resourceName: "avatar.png")
        avator.layer.borderColor = UIColor.white.cgColor
        avator.layer.borderWidth = 2
        header.addSubview(avator)
        
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 20)
        if let nameT = UserAccount.sharedInstance.phone {
            name.text = nameT
        } else {
            name.text = "未登录"
        }
        name.textColor = UIColor.white
        header.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.left.equalTo(avator.snp.right).offset(10)
            make.top.equalTo(background.snp.bottom).offset(-30)
            make.right.equalTo(-20)
            make.height.equalTo(30)
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
        footer.backgroundColor = UIColor(valueRGB: 0xEFEFF4)
        
        let button = UIButton(type: .custom)
        if (UserDefaults.standard.object(forKey: MemberIdKey) != nil) {
            button.setTitle("退出登录", for: .normal)
        }else{
            button.setTitle("登录", for: .normal)
        }
        button.backgroundColor = UIColor.theme
        button.addTarget(self, action: #selector(ProfileController.logout), for: .touchUpInside)
        footer.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(20)
            make.height.equalTo(40)
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    //MARK: - 私有方法
    func setupConfig() -> Void {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_setting.png").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(ProfileController.settingClick))
        
        NotificationCenter.default.addObserver(self, selector: #selector(ProfileController.requestUserInfo), name: NSNotification.Name(rawValue: LoginSuccessNotification), object: nil)
    }
    
    func setupLayout() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(0, 0, 49, 0))
        }
    }
    
    func requestUserInfo() -> Void {
        guard let userId = UserDefaults.standard.object(forKey: MemberIdKey) else {
            return
        }
        
        let param: Parameters = [
            "id":userId,
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_UserInfo, method: .get, parameters: param).responseJSON { (response) in
            guard let jsonDic = response.value as? NSDictionary else {
                return
            }
            if jsonDic["code"] as? Int == 200 {
                let data = jsonDic["data"] as! NSDictionary
                UserAccount.sharedInstance.phone = (data["tel"] as? Int)?.description
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - 事件方法
    func logout() -> Void {
        if (UserDefaults.standard.object(forKey: MemberIdKey) != nil) {
            //退出
            UserDefaults.standard.removeObject(forKey: MemberIdKey)
            UserAccount.sharedInstance.phone = nil
            tableView.reloadData()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: LogoutSuccessNotification), object: nil)
        }else{
            //登录
            navigationController?.pushViewController(LoginVC(), animated: true)
        }
    }
    func settingClick() -> Void {
        navigationController?.pushViewController(SettingVC(), animated: true)
    }
}
