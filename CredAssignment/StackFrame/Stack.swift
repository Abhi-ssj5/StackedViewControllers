//
//  Stack.swift
//  CredAssignment
//
//  Created by Abhijeet Choudhary on 03/09/21.
//

import UIKit

struct Stack<T> {
        
    private(set) var array:Array<T> = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    mutating func top() -> T? {
        return array.first
    }
}
