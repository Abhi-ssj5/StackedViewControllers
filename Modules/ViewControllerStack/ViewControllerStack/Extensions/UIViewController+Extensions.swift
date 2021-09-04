//
//  UIViewController+Extensions.swift
//  ViewControllerStack
//
//  Created by Abhijeet Choudhary on 04/09/21.
//

import UIKit

extension UIViewController {
    
    public func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        
        if let frame = frame {
            child.view.frame = frame
        }
        
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    public func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
