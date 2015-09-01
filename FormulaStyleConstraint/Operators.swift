//
//  Operators.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/09/02.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit


infix operator ~ {
    precedence 100
    associativity none
}

public func ~ (lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}

public func + (var lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    lhs.constant += rhs
    return lhs
}

public func +(lhs: CGFloat, var rhs: ConstraintTerm) -> ConstraintTerm {
    return rhs + lhs
}

public func * (var lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    lhs.multiplier *= rhs
    lhs.constant *= rhs
    return lhs
}

public func * (lhs: CGFloat, var rhs: ConstraintTerm) -> ConstraintTerm {
    return rhs * lhs
}

public func - (var lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    lhs.constant -= rhs
    return lhs
}

public func == (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .Equal, rhs)
}

public func <= (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .LessThanOrEqual, rhs)
}

public func >= (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .GreaterThanOrEqual, rhs)
}

public func == (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .Equal, rhs)
}

public func <= (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .LessThanOrEqual, rhs)
}

public func >= (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .GreaterThanOrEqual, rhs)
}

public func == (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs == lhs
}

public func <= (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >= (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs <= lhs
}



// MARK: - private function

private func createLayoutConstraint(lhs: ConstraintTerm, relatedBy: NSLayoutRelation, rhs: ConstraintTerm) -> NSLayoutConstraint {
    let multiplier = rhs.multiplier / lhs.multiplier
    let constant = (rhs.constant - lhs.constant) / lhs.multiplier
    let constraint = NSLayoutConstraint(
        item: lhs.view!, attribute: lhs.attribute,
        relatedBy: relatedBy,
        toItem: rhs.view, attribute: rhs.attribute,
        multiplier: multiplier, constant: constant)
    return constraint
}

private func createLayoutConstraint(lhs: ConstraintTerm, relatedBy: NSLayoutRelation, rhs: CGFloat) -> NSLayoutConstraint {
    let constant = (rhs - lhs.constant) / lhs.multiplier
    let constraint = NSLayoutConstraint(
        item: lhs.view!, attribute: lhs.attribute,
        relatedBy: relatedBy,
        toItem: nil, attribute: .NotAnAttribute,
        multiplier: 1.0, constant: constant)
    return constraint
}
