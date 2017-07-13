//
//  BorrowController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BorrowController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        var table = UITableView(frame: CGRect(x: 0, y: self.segmentView.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - self.segmentView.frame.height - 64 - 49), style: .plain)
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        return table
    }()
    
    lazy var segmentView: UIView = {
        var segmentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        segmentView.backgroundColor = UIColor.theme
        var segment = UISegmentedControl(items: ["申请借款", "进度查询"])
        segment.addTarget(self, action: #selector(BorrowController.segmentChange(segment:)), for: .valueChanged)
        segment.tintColor = UIColor.white
        segment.selectedSegmentIndex = 0;
        segmentView.addSubview(segment)
        segment.center = segmentView.center
        return segmentView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "小咖借"
        self.view.addSubview(self.segmentView)
        self.view.addSubview(self.tableView)
        
    }
    
    //MARK: - tableview代理方法
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = ApplyCell(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - 自定义代理方法
    
    //MARK: - 事件方法
    func segmentChange(segment: UISegmentedControl) -> Void {
        print(segment.selectedSegmentIndex)
    }

}
