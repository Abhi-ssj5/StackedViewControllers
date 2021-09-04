//
//  UIView+Extension.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 04/09/21.
//

import UIKit

extension UIView {
    
    func roundTopCorners(radius: CGFloat = 10.0) {
        let corners: UIRectCorner = [.topLeft, .topRight]
        clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
    
}
