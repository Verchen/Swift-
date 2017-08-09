//
//  BorrowController.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/12.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import DGElasticPullToRefresh
import PKHUD

class BorrowController: BaseController, UITableViewDelegate, UITableViewDataSource, ProgressCellDelegate {
    
    lazy var borrowTypeView: UITableView = {
        var table = UITableView(frame: CGRect.zero, style: .plain)
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        table.separatorStyle = .none
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        table.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.refreshBorrowData()
            }, loadingView: loadingView)
        table.dg_setPullToRefreshFillColor(UIColor.theme)
        table.dg_setPullToRefreshBackgroundColor(table.backgroundColor!)

        return table
    }()
    
    lazy var progressView: UITableView = {
        var table = UITableView(frame: CGRect.zero, style: .plain)
        table.delegate = self as UITableViewDelegate
        table.dataSource = self as UITableViewDataSource
        table.separatorStyle = .none
        table.isHidden = true
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        table.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.refreshProgressData()
            }, loadingView: loadingView)
        table.dg_setPullToRefreshFillColor(UIColor.theme)
        table.dg_setPullToRefreshBackgroundColor(table.backgroundColor!)

        return table
    }()
    
    lazy var segmentView: UIView = {
        var segmentView = UIView()
        segmentView.backgroundColor = UIColor.theme
        return segmentView
    }()
    
    lazy var segment: UISegmentedControl = {
        let segm = UISegmentedControl(items: ["申请借款", "进度查询"])
        segm.setWidth(120, forSegmentAt: 0)
        segm.setWidth(120, forSegmentAt: 1)
        segm.addTarget(self, action: #selector(BorrowController.segmentChange(segment:)), for: .valueChanged)
        segm.tintColor = UIColor.white
        segm.selectedSegmentIndex = 0;
        return segm
    }()
    
    lazy var emptyView: UIView = {
        let empty = UIView(frame: CGRect.zero)
        empty.backgroundColor = UIColor.white
        empty.isHidden = true
        return empty
    }()
    lazy var emptyImage: UIImageView = {
        let emptyImage = UIImageView()
        emptyImage.image = #imageLiteral(resourceName: "empty.png")
        return emptyImage
    }()
    lazy var emptyLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.text = "您还没有任何借款申请哦"
        emptyLabel.textColor = UIColor.init(valueRGB: 0xbfbfbf)
        emptyLabel.textAlignment = .center
        return emptyLabel
    }()
    
    var borrowDataSource: [BorrowModel] = [BorrowModel]()
    var progreDataSource: [ProgressModel] = [ProgressModel]()
    
    deinit {
        borrowTypeView.dg_removePullToRefresh()
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "佳易贷"
        
        NotificationCenter.default.addObserver(self, selector: #selector(BorrowController.refreshProgressData), name: NSNotification.Name(rawValue: LogoutSuccessNotification), object: nil)
        
        view.addSubview(segmentView)
        segmentView.addSubview(segment)
        view.addSubview(borrowTypeView)
        view.addSubview(progressView)
        progressView.addSubview(emptyView)
        emptyView.addSubview(emptyImage)
        emptyView.addSubview(emptyLabel)
        setupLayout()
        
        refreshBorrowData()
        refreshProgressData()
        
        
        let param: Parameters = [
            "grant_type":"password",
            "client_id":"occlient",
            "client_secret":"eyJpdiI6IndOMjdYaWZRTW1WSElyMFVNQXdjcXc9PSIsInZhbHVlIjoiXC9UeWVoU1FOdHFtdGlvbkZc",
            //FIXME: - 修改
            "username":"13261301876",
            "password":"111"
        ]
        
        Alamofire.request(URL_Token, method: .post, parameters: param).responseJSON { (response) in
            print("获取token", response.value ?? "")
            if response.result.isFailure {
                return
            }
            guard let jsonDic = response.value as? NSDictionary else{
                return
            }
            if jsonDic["access_token"] != nil {
                UserDefaults.standard.set(jsonDic["access_token"], forKey: TokenKey)
            }
            let param: Parameters = [
                "grant_type":"refresh_token",
                "refresh_token":jsonDic["refresh_token"] ?? "",
                //FIXME: - 修改
                "username":"13261301876",
                "password":"111",
                "client_id":"occlient",
                "client_secret":"eyJpdiI6IndOMjdYaWZRTW1WSElyMFVNQXdjcXc9PSIsInZhbHVlIjoiXC9UeWVoU1FOdHFtdGlvbkZc"
            ]
            Alamofire.request(URL_RefreshToken, method: .post, parameters: param).responseJSON(completionHandler: { (response) in
                print("获取刷新token",response.value ?? "")
            })
        }
        
    }
    func setupLayout() -> Void {
        segmentView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(45)
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
        emptyView.snp.makeConstraints { (make) in
            make.width.height.equalTo(progressView)
            make.center.equalTo(progressView)
        }
        emptyImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(emptyView)
            make.centerY.equalTo(emptyView).offset(-40)
        }
        emptyLabel.snp.makeConstraints { (make) in
            make.width.equalTo(emptyView)
            make.top.equalTo(emptyImage.snp.bottom).offset(20)
            make.height.equalTo(20)
        }
        
    }
    
    //MARK: - tableview代理方法
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case borrowTypeView:
            return borrowDataSource.count
        default:
            emptyView.isHidden = progreDataSource.count>0
            return progreDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView {
        case borrowTypeView:
            var cell = tableView.dequeueReusableCell(withIdentifier: "ApplyCell") as? ApplyCell
            if cell == nil {
                cell = ApplyCell(style: .default, reuseIdentifier: "ApplyCell")
            }
            cell?.model = borrowDataSource[indexPath.row]
            return cell!
        default:
            var cell = tableView.dequeueReusableCell(withIdentifier: "ProgressCell") as? ProgressCell
            if cell == nil {
                cell = ProgressCell(style: .default, reuseIdentifier: "ProgressCell")
            }
            cell?.delegate = self
            cell?.index = indexPath.row
            cell?.model = progreDataSource[indexPath.row]
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
        case borrowTypeView:
            if UserDefaults.standard.object(forKey: MemberIdKey) != nil {
                let model = borrowDataSource[indexPath.row]
                if model.lock == 1 {
                    let vc = BorrowDetailVC()
                    vc.id = String(model.id)
                    navigationController?.pushViewController(vc, animated: true)
                }
            }else{
                navigationController?.pushViewController(LoginVC(), animated: true)
            }
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
    func progressCellCancel(progreModel: ProgressModel, index: Int) {
        DeApply(progreModel: progreModel, index: index)
    }

    //MARK: - 自定义方法
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
    
    func DeApply(progreModel: ProgressModel, index: Int) -> Void {
        let param: Parameters = [
            "userId":UserDefaults.standard.object(forKey: MemberIdKey) ?? "",
            "loanId":progreModel.loan_id,
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        
        Alamofire.request(URL_Deapply, method: .post, parameters: param).responseJSON { (response) in
            print(response.value ?? "无")
            guard let jsonDic = response.value as? NSDictionary else{
                return
            }
            
            if jsonDic["code"] as? Int == 200 {
                HUD.flash(.labeledSuccess(title: jsonDic["message"] as? String, subtitle: nil), delay: 1)
                self.refreshProgressData()
            }
        }
    }
    
    /// 获取借款类型列表
    func refreshBorrowData() -> Void {
        if UserDefaults.standard.object(forKey: MemberIdKey) != nil {
            requestAccountBorrow()
        }else{
            requestGeneralBorrow()
        }
    }
    
    /// 获取未登录借款类型列表
    func requestGeneralBorrow() -> Void {
        Alamofire.request(URL_BORROW).responseJSON { (response) in
            print("未登录借款列表", response)
            self.borrowTypeView.dg_stopLoading()
            guard let jsonDic = response.value as? NSDictionary else{
                return
            }
            
            if jsonDic["code"] as? Int == 200 {
                self.borrowDataSource = Mapper<BorrowModel>().mapArray(JSONArray: jsonDic["data"] as! Array)
                self.borrowTypeView.reloadData()
            }
        }
    }
    /// 获取已登录借款类型列表
    func requestAccountBorrow() -> Void {
        let params:Parameters = [
            "userId":UserDefaults.standard.object(forKey: MemberIdKey) ?? "",
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_BORROW, method:.post, parameters:params).responseJSON { (response) in
            self.borrowTypeView.dg_stopLoading()
            print(response.value ?? "")
            guard let jsonDic = response.value as? NSDictionary else{
                return
            }
            
            if jsonDic["code"] as? Int == 200 {
                self.borrowDataSource = Mapper<BorrowModel>().mapArray(JSONArray: jsonDic["data"] as! Array)
                self.borrowTypeView.reloadData()
            }
        }
    }
    
    /// 获取借款进度列表
    func refreshProgressData() -> Void {
        let param:Parameters = [
            "userId":UserDefaults.standard.object(forKey: MemberIdKey) ?? "",
            "access_token":UserDefaults.standard.object(forKey: TokenKey) ?? "",
            "timestamp":Date.timeIntervalBetween1970AndReferenceDate
        ]
        Alamofire.request(URL_Progress, method: .post, parameters: param).responseJSON { (response) in
            print("进度列表", response)
            self.progressView.dg_stopLoading()
            guard let jsonDic = response.value as? NSDictionary else{
                return
            }
            if jsonDic["code"] as? Int == 200 {
                self.progreDataSource = Mapper<ProgressModel>().mapArray(JSONArray: jsonDic["data"] as! Array)
                self.progressView.reloadData()
            }
        }
        
    }

}
