//
//  UIViewController+Extension.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 03/09/21.
//

import UIKit

protocol StoryboardContainer: AnyObject {
    static var storyboardName: String { get }
    static func instance() -> Self?
}

extension StoryboardContainer {
    
    static func instance() -> Self? {
        self.getInstanceOfController()
    }
    
    private static func getInstanceOfController<T>() -> T? {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: Bundle(for: self))
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T
    }
    
}

extension UIViewController {
    
    func add(_ child: UIViewController, container: UIView) {
        addChild(child)
        child.view.frame = container.bounds
        
        container.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
}
