
//
//  UIView+Extension.swift
//  CardView
//
//  Created by Dang Trung Hieu on 10/4/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
