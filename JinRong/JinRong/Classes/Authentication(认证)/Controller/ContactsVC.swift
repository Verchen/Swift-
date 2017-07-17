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
        let table = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64), style: .grouped)
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "联系人"
        
        
    }
    
    //MARK: - TABLE代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = indexPath.section.description
        return cell!
    }

}
