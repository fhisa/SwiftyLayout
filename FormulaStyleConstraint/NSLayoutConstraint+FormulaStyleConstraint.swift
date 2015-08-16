//
//  NSLayoutConstraint+FormulaStyleConstraint.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/08/17.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import Foundation

infix operator ~ {
    precedence 50
    associativity none
}

public func ~ (lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}
