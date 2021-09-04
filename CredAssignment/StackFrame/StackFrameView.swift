//
//  StackFrameView.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 04/09/21.
//

import UIKit

public protocol StackFrameView where Self: UIViewController {
    var collapseViewHeight: CGFloat { get set }
    var viewControllers: [StackFrameSubViewController] { get }
}

public enum StackFrameSubViewControllerState {
    case collapsed
    case expanded
}

public protocol StackFrameSubViewController where Self: UIViewController {
    var state: StackFrameSubViewControllerState { get }
    var delegate: StackFrameSubViewControllerDelegate? { get set }
    
    func updateState(_ state: StackFrameSubViewControllerState)
}

public protocol StackFrameSubViewControllerDelegate: AnyObject {
    func stackFrameSubViewController(_ controller: StackFrameSubViewController,
                                     collapseButtonTapped button: UIButton)
    func stackFrameSubViewController(_ controller: StackFrameSubViewController,
                                     nextButtonTapped button: UIButton)
}
