//
//  DottedView.swift
//  JinRong
//
//  Created by 乔伟成 on 2017/7/15.
//  Copyright © 2017年 乔伟成. All rights reserved.
//

import UIKit

class DottedView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shape = CAShapeLayer()
        shape.frame = bounds
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.lightGray.cgColor
        shape.lineWidth = frame.height
        shape.lineJoin = kCALineJoinRound
        shape.lineDashPattern = [7, 5]
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        shape.path = path
        layer.addSublayer(shape)

        //        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        //        [shapeLayer setBounds:lineView.bounds];
        //        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
        //        [shapeLayer setFillColor:[UIColor clearColor].CGColor];
        //        //  设置虚线颜色为blackColor
        //        [shapeLayer setStrokeColor:[UIColor blackColor].CGColor];
        //        //  设置虚线宽度
        //        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
        //        [shapeLayer setLineJoin:kCALineJoinRound];
        //        //  设置线宽，线间距
        //        [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:1], nil nil]];
        //        //  设置路径
        //        CGMutablePathRef path = CGPathCreateMutable();
        //        CGPathMoveToPoint(path, NULL, 0, 0);
        //        CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
        //        [shapeLayer setPath:path];
        //        CGPathRelease(path);
        //        //  把绘制好的虚线添加上来
        //        [lineView.layer addSublayer:shapeLayer];

    }
}
