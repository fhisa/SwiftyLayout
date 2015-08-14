//
//  LayoutTerm.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit

public struct LayoutTerm
{
    let view: UIView?
    let attribute: NSLayoutAttribute
    var multiplier: CGFloat
    var constant: CGFloat

    public init(
        view v: UIView? = nil,
        attribute a: NSLayoutAttribute = .NotAnAttribute,
        multiplier m: CGFloat = 1.0,
        constant c: CGFloat = 0.0)
    {
        view = v
        attribute = a
        multiplier = m
        constant = c
    }
}

public func + (var lhs: LayoutTerm, rhs: CGFloat) -> LayoutTerm {
    lhs.constant += rhs
    return lhs
}

public func +(lhs: CGFloat, var rhs: LayoutTerm) -> LayoutTerm {
    return rhs + lhs
}

public func * (var lhs: LayoutTerm, rhs: CGFloat) -> LayoutTerm {
    lhs.multiplier *= rhs
    lhs.constant *= rhs
    return lhs
}

public func * (lhs: CGFloat, var rhs: LayoutTerm) -> LayoutTerm {
    return rhs * lhs
}

public func - (var lhs: LayoutTerm, rhs: CGFloat) -> LayoutTerm {
    lhs.constant -= rhs
    return lhs
}

public func == (lhs: LayoutTerm, rhs: LayoutTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .Equal, rhs)
}

public func <= (lhs: LayoutTerm, rhs: LayoutTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .LessThanOrEqual, rhs)
}

public func >= (lhs: LayoutTerm, rhs: LayoutTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .GreaterThanOrEqual, rhs)
}

public func == (lhs: LayoutTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .Equal, rhs)
}

public func <= (lhs: LayoutTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .LessThanOrEqual, rhs)
}

public func >= (lhs: LayoutTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .GreaterThanOrEqual, rhs)
}

public func == (lhs: CGFloat, rhs: LayoutTerm) -> NSLayoutConstraint {
    return rhs == lhs
}

public func <= (lhs: CGFloat, rhs: LayoutTerm) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func >= (lhs: CGFloat, rhs: LayoutTerm) -> NSLayoutConstraint {
    return rhs <= lhs
}



// MARK: - private function

private func createLayoutConstraint(lhs: LayoutTerm, relatedBy: NSLayoutRelation, rhs: LayoutTerm) -> NSLayoutConstraint {
    let multiplier = rhs.multiplier / lhs.multiplier
    let constant = (rhs.constant - lhs.constant) / lhs.multiplier
    let constraint = NSLayoutConstraint(
        item: lhs.view!, attribute: lhs.attribute,
        relatedBy: relatedBy,
        toItem: rhs.view, attribute: rhs.attribute,
        multiplier: multiplier, constant: constant)
    return constraint
}

private func createLayoutConstraint(lhs: LayoutTerm, relatedBy: NSLayoutRelation, rhs: CGFloat) -> NSLayoutConstraint {
    let constant = (rhs - lhs.constant) / lhs.multiplier
    let constraint = NSLayoutConstraint(
        item: lhs.view!, attribute: lhs.attribute,
        relatedBy: relatedBy,
        toItem: nil, attribute: .NotAnAttribute,
        multiplier: 1.0, constant: constant)
    return constraint
}

