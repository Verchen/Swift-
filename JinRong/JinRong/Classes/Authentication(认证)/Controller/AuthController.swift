//
//  AuthController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class AuthController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        var table = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64 - 49), style: .plain)
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = indexPath.row.description
        return cell!
    }

}
