//
//  HomeViewController.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 03/09/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.roundTopCorners()
        }
    }
    
    // MARK: - Private members
    
    private var stackFrameViewController: StackFrameView?
    
    // MARK: - Public members
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        let firstVC = FirstViewController.instance()
        let secondVC = SecondViewController.instance()
        let thirdVC = ThirdViewController.instance()
        let fourthVC = FourthViewController.instance()
        
        let controllers: [StackFrameSubViewController] = [firstVC,
                                                          secondVC,
                                                          thirdVC,
                                                          fourthVC].compactMap({ $0 })
        stackFrameViewController = StackFrameViewController(viewControllers: controllers)
        
        guard let stackFrameVC = stackFrameViewController else {
            return
        }
        add(stackFrameVC, container: containerView)
    }
}
