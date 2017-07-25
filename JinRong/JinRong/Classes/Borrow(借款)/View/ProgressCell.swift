//
//  ProgressCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/13.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class ProgressCell: UITableViewCell {
    
    var line = UIView()
    //借款金额
    var totalLabel = UILabel()
    //本金栏容器
    var bjContainer = UIImageView()
    //本金
    var bj = UILabel()
    //本金金额
    var bjValue = UILabel()
    //利息
    var lx = UILabel()
    //利息金额
    var lxValue = UILabel()
    //还款方式栏容器
    var hkfsContainer = UIImageView()
    //还款方式
    var hkfs = UILabel()
    //还款方式值
    var hkfsValue = UILabel()
    //状态
    var zt = UILabel()
    //状态值
    var ztValue = UILabel()
    //取消按钮
    var cancelButton = UIButton()
    
    var newModel : ProgressModel!
    var model: ProgressModel {
        get {
            return self.newModel
        }
        set {
            newModel = newValue
            
            totalLabel.text = "借款金额"+newModel.money.description+"元   |   "+newModel.day.description+"天期限"
            bjValue.text = newModel.inAccountMoney.description
            lxValue.text = newModel.interest.description
            ztValue.text = (newModel.audit == 0) ? "审核中":"审核已通过"
        }
    }
    


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    func setupUI() -> Void {
        let height:CGFloat = 25
        
        line.backgroundColor = UIColor.theme
        contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(10)
            make.height.equalTo(1)
        }
        
//        totalLabel.text = "借款金额60000元   |   14天期限"
        contentView.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(10)
            make.top.equalTo(10)
            make.height.equalTo(height)
        }
        
        bjContainer.image = UIImage.colorImage(color: UIColor.theme)
        contentView.addSubview(bjContainer)
        bjContainer.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(totalLabel.snp.bottom)
            make.height.equalTo(height)
        }
        
        bj.textColor = UIColor.white
        bj.text = "本金"
        bjContainer.addSubview(bj)
        bj.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(0)
            make.width.equalTo(50)
            make.height.equalTo(height)
        }
        
        bjValue.textAlignment = .right
        bjValue.textColor = UIColor.white
//        bjValue.text = "50000"
        bjContainer.addSubview(bjValue)
        bjValue.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
        lx.text = "利息"
        contentView.addSubview(lx)
        lx.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(bjContainer.snp.bottom)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
//        lxValue.text = "1000"
        lxValue.textAlignment = .right
        contentView.addSubview(lxValue)
        lxValue.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(bjContainer.snp.bottom)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
        hkfsContainer.image = UIImage.colorImage(color: UIColor.theme)
        contentView.addSubview(hkfsContainer)
        hkfsContainer.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(lx.snp.bottom)
            make.height.equalTo(height)
        }
        
        hkfs.textColor = UIColor.white
        hkfs.text = "还款方式"
        hkfsContainer.addSubview(hkfs)
        hkfs.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
        hkfsValue.textColor = UIColor.white
        hkfsValue.textAlignment = .right
        hkfsValue.text = "等额本金"
        hkfsContainer.addSubview(hkfsValue)
        hkfsValue.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
        zt.text = "状态"
        contentView.addSubview(zt)
        zt.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(hkfsContainer.snp.bottom)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
//        ztValue.text = "审核中"
        ztValue.textAlignment = .right
        contentView.addSubview(ztValue)
        ztValue.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(hkfsContainer.snp.bottom)
            make.width.equalTo(100)
            make.height.equalTo(height)
        }
        
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setBackgroundImage(UIImage.colorImage(color: UIColor.theme), for: .normal)
        contentView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(zt.snp.bottom)
            make.height.equalTo(1.5*height)
            make.bottom.equalTo(-20)
        }
    }
}
