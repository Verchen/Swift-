//
//  DottedBoardView.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/19.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class DottedBoardView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let border = CAShapeLayer()
        border.frame = bounds
        border.path = UIBezierPath(roundedRect: border.bounds, cornerRadius: 5).cgPath
        border.fillColor = UIColor.clear.cgColor
        border.strokeColor = UIColor.theme.cgColor
        border.lineWidth = 2
        border.lineDashPattern = [10,5]
        layer.addSublayer(border)

    }

}
