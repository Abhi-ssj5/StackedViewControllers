//
//  SecondViewController.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 03/09/21.
//

import UIKit

final class SecondViewController: UIViewController, StoryboardContainer {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collapseView: UIView!
    
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.roundTopCorners()
        }
    }
    
    // MARK: - Public members
    
    private(set) var state: StackFrameSubViewControllerState = .expanded {
        didSet {
            stateChangeUpdate()
        }
    }
    weak var delegate: StackFrameSubViewControllerDelegate?
    
    // MARK: - Static members
    
    static var storyboardName: String {
        return StoryboardNames.main
    }
    
    // MARK: - LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.roundTopCorners()
    }
    
    // MARK: - Private method
    
    private func stateChangeUpdate() {
        switch state {
        case .expanded:
            self.collapseView.isHidden = true
        case .collapsed:
            self.collapseView.isHidden = false
        }
    }
    
    // MARK: - Button Actions
    
    @IBAction private func collapseButtonTapped(_ sender: UIButton) {
        delegate?.stackFrameSubViewController(self, collapseButtonTapped: sender)
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        delegate?.stackFrameSubViewController(self, nextButtonTapped: sender)
    }
}

// MARK: - StackFrameSubViewController methods

extension SecondViewController: StackFrameSubViewController {
    
    func updateState(_ state: StackFrameSubViewControllerState) {
        self.state = state
    }
    
}
