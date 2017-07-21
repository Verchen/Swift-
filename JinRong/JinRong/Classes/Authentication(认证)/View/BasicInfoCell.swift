//
//  BasicInfoCell.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/13.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

public enum BasicInfoType : Int {
    
    case contacts
    
    case bankCar
    
    case phoneAuth
    
    case identityAuth
}


protocol BasicCellDelegate: NSObjectProtocol {
    func basicCell(_ cell: BasicInfoCell, didSelect type: BasicInfoType)
}

class BasicInfoCell: UITableViewCell {
    
    weak open var delegate: BasicCellDelegate?


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    func setupUI() -> Void {
        let width:CGFloat = UIScreen.main.bounds.width / 4
        let height = width
        
        let images = ["contacts", "bank", "phone", "shenfen"]
        let titles = ["联系人", "银行卡", "手机实名", "身份认证"]
        
        for i in 0...3 {
            let item = UIView(frame: CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height))
            item.tag = i
            contentView.addSubview(item)
            
            let image = UIImageView(image: UIImage(named: images[i]))
            item.addSubview(image)
            image.frame = CGRect(x: (width - image.frame.width) * 0.5, y: 10, width: image.frame.width, height: image.frame.height)
            
            let title = UILabel(frame: CGRect(x: 0, y: height - 30, width: width, height: 20))
            title.text = titles[i]
            title.textColor = UIColor.theme
            title.textAlignment = .center
            title.font = UIFont.systemFont(ofSize: 15)
            item.addSubview(title)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(BasicInfoCell.clickItem(tap:)))
            item.addGestureRecognizer(tap)
            
        }
        
    }
    
    func clickItem(tap: UITapGestureRecognizer) -> Void {
        delegate?.basicCell(self, didSelect: BasicInfoType(rawValue: (tap.view?.tag)!)!)
    }

}
