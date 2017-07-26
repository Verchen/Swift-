//
//  BillController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class BillController: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    var billModel: BillModel?
    
    lazy var segmentView: UISegmentedControl = {
        var segment = UISegmentedControl(items: ["应还款", "已还款"])
        segment.tintColor = UIColor.white
        segment.selectedSegmentIndex = 0
        segment.setWidth(120, forSegmentAt: 0)
        segment.setWidth(120, forSegmentAt: 1)
        segment.addTarget(self, action: #selector(BillController.segmentChange(segment:)), for: .valueChanged)
        return segment
    }()
    //应还列表
    lazy var repayView: UITableView = {
        var table = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64 - 49), style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        return table
    }()
    //已还列表
    lazy var repaidView: UITableView = {
        var table = UITableView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64 - 49), style: .plain)
        table.delegate = self
        table.dataSource = self
        table.isHidden = true
        return table
    }()

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
        navigationItem.titleView = segmentView
        view.addSubview(repayView)
        view.addSubview(repaidView)
        
        requestBillList()
    }
    
    func setupConfig() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(BillController.requestBillList), name: NSNotification.Name(rawValue: LoginSuccessNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BillController.requestBillList), name: NSNotification.Name(rawValue: LogoutSuccessNotification), object: nil)
    }
    
    //MARK: - 网络请求方法
    func requestBillList() -> Void {
        let param: Parameters = [
            "userId":UserDefaults.standard.object(forKey: MemberIdKey) ?? "",
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_Bill, method: .post, parameters: param).responseJSON { (response) in
            guard let jsonDic = response.value as? NSDictionary else {
                return
            }
            if jsonDic["code"] as? Int == 200 {
                self.billModel = BillModel(JSON: jsonDic["data"] as! [String : Any])
                self.repayView.reloadData()
            }
        }
        
    }
    
    //MARK: - tableview代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.isEqual(repayView) {
            return 2
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(repayView) {
            if section == 0 {
                return 1
            }else{
                guard (billModel != nil) else {
                    return 0
                }
                return (billModel?.notYetList?.count)!
            }
        }else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.isEqual(repayView) {
            if indexPath.section == 0 {
                var cell = tableView.dequeueReusableCell(withIdentifier: "SumCell") as? SumCell
                if cell == nil {
                    cell = SumCell(style: .default, reuseIdentifier: "SumCell")
                }
                cell?.model = billModel
                return cell!
                
            }
            var cell = tableView.dequeueReusableCell(withIdentifier: "BillCell")
            if cell == nil {
                cell = BillCell(style: .default, reuseIdentifier: "BillCell")
            }
            return cell!
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "RepaidCell")
            if cell == nil {
                cell = RepaidCell(style: .default, reuseIdentifier: "RepaidCell")
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.isEqual(repayView) {
            switch indexPath.section {
            case 0:
                return 85
            default:
                return 195 + 40
            }
        }else{
            return 65
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.isEqual(repayView) {
            return 20
        }else{
            return 0.001
        }
    }
    
    //MARK: - 事件方法
    func segmentChange(segment: UISegmentedControl) -> Void {
        if segment.selectedSegmentIndex == 0 {
            repayView.isHidden = false
            repaidView.isHidden = true
        }else{
            repayView.isHidden = true
            repaidView.isHidden = false
        }
    }

}
