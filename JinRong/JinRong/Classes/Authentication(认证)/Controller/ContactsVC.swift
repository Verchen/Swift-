//
//  ContactsVC.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/17.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class ContactsVC: BaseController, UITableViewDelegate, UITableViewDataSource{

    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
        view.addSubview(tableView)
        layoutSubviews()
    }
    
    //MARK: - TABLE代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell") as? ContactsCell
        if cell == nil {
            cell = ContactsCell(style: .default, reuseIdentifier: "ContactsCell")
        }

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    //MARK: - 私有方法
    func setupConfig() -> Void {
        title = "联系人"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add.png").withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(ContactsVC.rightItemClick))
    }
    
    func rightItemClick() -> Void {
        navigationController?.pushViewController(AddContactsVC(), animated: true)
    }
    
    func layoutSubviews() -> Void {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }

}
