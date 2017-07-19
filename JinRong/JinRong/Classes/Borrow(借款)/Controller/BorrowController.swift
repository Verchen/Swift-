//
//  BorrowController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class BorrowController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var borrowTypeView: UITableView = {
        var table = UITableView(frame: CGRect.zero, style: .plain)
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        table.separatorStyle = .none
        return table
    }()
    
    lazy var progressView: UITableView = {
        var table = UITableView(frame: CGRect.zero, style: .plain)
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        table.separatorStyle = .none
        table.isHidden = true
        return table
    }()
    
    lazy var segmentView: UIView = {
        var segmentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        segmentView.backgroundColor = UIColor.theme
        return segmentView
    }()
    
    lazy var segment: UISegmentedControl = {
        let segm = UISegmentedControl(items: ["申请借款", "进度查询"])
        segm.addTarget(self, action: #selector(BorrowController.segmentChange(segment:)), for: .valueChanged)
        segm.tintColor = UIColor.white
        segm.selectedSegmentIndex = 0;
        return segm
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "佳易贷"
        view.addSubview(segmentView)
        segmentView.addSubview(segment)
        view.addSubview(borrowTypeView)
        view.addSubview(progressView)
        setupLayout()
    }
    func setupLayout() -> Void {
        segmentView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(40)
        }
        segment.snp.makeConstraints { (make) in
            make.center.equalTo(segmentView)
        }
        borrowTypeView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(segmentView.snp.bottom)
            make.bottom.equalTo(-49)
        }
        progressView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(segmentView.snp.bottom)
            make.bottom.equalTo(-49)
        }
    }
    
    //MARK: - tableview代理方法
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case borrowTypeView:
            return 50
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case borrowTypeView:
            var cell = tableView.dequeueReusableCell(withIdentifier: "ApplyCell")
            if cell == nil {
                cell = ApplyCell(style: .default, reuseIdentifier: "ApplyCell")
            }
            return cell!
        default:
            var cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell")
            if cell == nil {
                cell = ProgressCell(style: .default, reuseIdentifier: "ProgressCell")
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch tableView {
        case borrowTypeView:
            let vc = BorrowDetailVC()
            navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case borrowTypeView:
            return 100
        default:
            return 200
        }
    }
    
    //MARK: - 自定义代理方法
    
    //MARK: - 事件方法
    func segmentChange(segment: UISegmentedControl) -> Void {
        switch segment.selectedSegmentIndex {
        case 0:
            progressView.isHidden = true
            borrowTypeView.isHidden = false
            break
            
        case 1:
            progressView.isHidden = false
            borrowTypeView.isHidden = true
            break
        
        default: break
            
        }
    }

}
