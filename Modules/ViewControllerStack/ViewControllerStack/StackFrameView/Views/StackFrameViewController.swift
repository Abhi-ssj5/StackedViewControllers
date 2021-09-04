//
//  StackFrameViewController.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 04/09/21.
//

import UIKit

final class StackFrameViewController: UIViewController, StackFrameView {
    
    // MARK: - Private members
    
    private struct Defaults {
        static let topConstraintConstant: CGFloat = 64.0
    }
    
    private var controllerStack = Stack<StackFrameSubViewController>()
    
    // MARK: - Public member
    
    var collapseViewHeight: CGFloat = Defaults.topConstraintConstant
    private(set) var viewControllers: [StackFrameSubViewController]
    
    // MAR: - Initializer
    
    /// Initializer
    /// - Parameter viewControllers: Between 2 to 4 UIViewController(s) are required for creating an instance
    init?(viewControllers: [StackFrameSubViewController]) {
        if viewControllers.isEmpty
            || viewControllers.count < 2
            || viewControllers.count > 4 {
            return nil
        }
        self.viewControllers = viewControllers
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegates()
        configureView()
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        view.backgroundColor = .clear
        guard let firstVC = viewControllers.first else {
            return
        }
        controllerStack.push(firstVC)
        add(firstVC, frame: view.bounds)
    }
    
    private func configureDelegates() {
        for (index, vc) in viewControllers.enumerated() {
            vc.view.tag = index
            vc.delegate = self
        }
    }
    
}

// MARK: - StackFrameSubViewControllerDelegate methods

extension StackFrameViewController: StackFrameSubViewControllerDelegate {
    
    /// Method for popping items out of stack
    /// - Parameters:
    ///   - controller: StackFrameSubViewController
    ///   - button: UIButton
    func stackFrameSubViewController(_ controller: StackFrameSubViewController,
                                     collapseButtonTapped button: UIButton) {
        
        controller.updateState(.expanded)
        
        let selectedIndex = controller.view.tag
        
        for (index, _) in self.controllerStack.array.enumerated() {
            if index > selectedIndex,
               let vc = controllerStack.pop() {
                UIView.animate(withDuration: 0.2,
                               delay: 0,
                               options: .curveEaseInOut) { [weak self] in
                    guard let self = self else {
                        return
                    }
                    vc.view.frame = CGRect(x: 0,
                                           y: self.view.bounds.height,
                                           width: self.view.bounds.width,
                                           height: 0)
                } completion: { bool in
                    vc.updateState(.collapsed)
                    vc.remove()
                }
            }
        }
    }
    
    /// Method for appending view in stack
    /// - Parameters:
    ///   - controller: StackFrameSubViewController
    ///   - button: UIButton
    func stackFrameSubViewController(_ controller: StackFrameSubViewController,
                                     nextButtonTapped button: UIButton) {
        let index = controller.view.tag + 1
        guard index >= 0,
              index < viewControllers.count else {
            return
        }
        let nextViewController = self.viewControllers[index]
        let topConstant: CGFloat = Defaults.topConstraintConstant * CGFloat(index)
        nextViewController.updateState(.expanded)
        
        let viewHeight: CGFloat = self.view.bounds.height - topConstant
        let viewCenter: CGFloat = (viewHeight/2) + topConstant
        
        add(nextViewController, frame: CGRect(x: 0,
                                              y: viewHeight,
                                              width: self.view.bounds.width,
                                              height: viewHeight))
        view.bringSubviewToFront(nextViewController.view)
        
        UIView.animate(withDuration: 0.2,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
                        nextViewController.view.center.y = viewCenter
                       },
                       completion: nil)
        
        controller.updateState(.collapsed)
        controllerStack.push(nextViewController)
    }
    
}
