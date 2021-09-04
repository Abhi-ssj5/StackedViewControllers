//
//  StackViewFrameBuilder.swift
//  ViewControllerStack
//
//  Created by Abhijeet Choudhary on 04/09/21.
//

import Foundation

public struct StackViewFrameBuilder {
    
    public static func configure(controllers: [StackFrameSubViewController]) -> StackFrameView? {
        return StackFrameViewController(viewControllers: controllers)
    }
    
}
