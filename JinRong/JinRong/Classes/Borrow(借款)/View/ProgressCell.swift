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
        let width:CGFloat = UIScreen.main.bounds.width
        
        line.frame = CGRect(x: 0, y: 10, width: width, height: 1)
        line.backgroundColor = UIColor.theme
        contentView.addSubview(line)
        
        totalLabel.frame = CGRect(x: 10, y: 10, width: width, height: height)
        totalLabel.text = "借款金额60000元   |   14天期限"
        contentView.addSubview(totalLabel)
        
        bjContainer.frame = CGRect(x: 0, y: totalLabel.frame.maxY, width: width, height: height)
        bjContainer.image = UIImage.colorImage(color: UIColor.theme)
        contentView.addSubview(bjContainer)
        
        bj.frame = CGRect(x: 10, y: 0, width: 50, height: height)
        bj.textColor = UIColor.white
        bj.text = "本金"
        bjContainer.addSubview(bj)
        
        bjValue.frame = CGRect(x: 100, y: 0, width: width - 110, height: height)
        bjValue.textAlignment = .right
        bjValue.textColor = UIColor.white
        bjValue.text = "50000"
        bjContainer.addSubview(bjValue)
        
        lx.frame = CGRect(x: 10, y: bjContainer.frame.maxY, width: 100, height: height)
        lx.text = "利息"
        contentView.addSubview(lx)
        
        lxValue.frame = CGRect(x: 100, y: bjContainer.frame.maxY, width: width - 110, height: height)
        lxValue.text = "1000"
        lxValue.textAlignment = .right
        contentView.addSubview(lxValue)
        
        hkfsContainer.frame = CGRect(x: 0, y: lx.frame.maxY, width: width, height: height)
        hkfsContainer.image = UIImage.colorImage(color: UIColor.theme)
        contentView.addSubview(hkfsContainer)
        
        hkfs.frame = CGRect(x: 10, y: 0, width: 100, height: height)
        hkfs.textColor = UIColor.white
        hkfs.text = "还款方式"
        hkfsContainer.addSubview(hkfs)
        
        hkfsValue.frame = CGRect(x: 100, y: 0, width: width - 110, height: height)
        hkfsValue.textColor = UIColor.white
        hkfsValue.textAlignment = .right
        hkfsValue.text = "等额本金"
        hkfsContainer.addSubview(hkfsValue)
        
        zt.frame = CGRect(x: 10, y: hkfsContainer.frame.maxY, width: 100, height: height)
        zt.text = "状态"
        contentView.addSubview(zt)
        
        ztValue.frame = CGRect(x: 100, y: hkfsContainer.frame.maxY, width: width - 110, height: height)
        ztValue.text = "审核中"
        ztValue.textAlignment = .right
        contentView.addSubview(ztValue)
        
        cancelButton.frame = CGRect(x: 0, y: zt.frame.maxY, width: width, height: 1.5 * height)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setBackgroundImage(UIImage.colorImage(color: UIColor.theme), for: .normal)
        contentView.addSubview(cancelButton)
    }
}
