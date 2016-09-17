//
//  Operators.swift
//  SwiftyLayout
//
//  Created by fhisa on 2015/09/02.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

#if os(iOS)

    import UIKit
    public typealias LayoutPriority = UILayoutPriority

    #else

    import AppKit
    public typealias LayoutPriority = NSLayoutPriority

#endif

precedencegroup LayoutPriorityPrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
}
infix operator ~ : LayoutPriorityPrecedence


public func ~ (lhs: NSLayoutConstraint, rhs: LayoutPriority) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}

public func ~ (lhs: NSLayoutConstraint, rhs: Int) -> NSLayoutConstraint {
    return lhs ~ LayoutPriority(rhs)
}

public func ~ (lhs: NSLayoutConstraint, rhs: Double) -> NSLayoutConstraint {
    return lhs ~ LayoutPriority(rhs)
}

// MARK: - x + c
public func +(lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    var lhs = lhs
    lhs.constant += rhs
    return lhs
}

public func +(lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs + CGFloat(rhs)
}

public func +(lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs + CGFloat(rhs)
}

// MARK: - c + x
public func +(lhs: CGFloat, rhs: ConstraintTerm) -> ConstraintTerm {
    return rhs + lhs
}

public func +(lhs: Int, rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) + rhs
}

public func +(lhs: Double, rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) + rhs
}

// MARK: - x * c
public func * (lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    var lhs = lhs
    lhs.multiplier *= rhs
    lhs.constant *= rhs
    return lhs
}

public func * (lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs * CGFloat(rhs)
}

public func * (lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs * CGFloat(rhs)
}

// MARK: - c * x
public func * (lhs: CGFloat, rhs: ConstraintTerm) -> ConstraintTerm {
    return rhs * lhs
}

public func * (lhs: Int, rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) * rhs
}

public func * (lhs: Double, rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) * rhs
}

// MARK: - x - c
public func - (lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    var lhs = lhs
    lhs.constant -= rhs
    return lhs
}

public func - (lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs - CGFloat(rhs)
}

public func - (lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs - CGFloat(rhs)
}

// MARK: - x / c
public func / (lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    var lhs = lhs
    lhs.multiplier /= rhs
    lhs.constant /= rhs
    return lhs
}

public func / (lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs / CGFloat(rhs)
}

public func / (lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs / CGFloat(rhs)
}

// MARK: - x == y
public func == (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs: lhs, relatedBy: .equal, rhs: rhs)
}

// MARK: - x == c
public func == (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs: lhs, relatedBy: .equal, rhs: rhs)
}

public func == (lhs: ConstraintTerm, rhs: Int) -> NSLayoutConstraint {
    return lhs == CGFloat(rhs)
}

public func == (lhs: ConstraintTerm, rhs: Double) -> NSLayoutConstraint {
    return lhs == CGFloat(rhs)
}

// MARK: - c == x
public func == (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs == lhs
}

public func == (lhs: Int, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) == rhs
}

public func == (lhs: Double, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) == rhs
}

// MARK: - x <= y
public func <= (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs: lhs, relatedBy: .lessThanOrEqual, rhs: rhs)
}

// MARK: - x <= c
public func <= (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs: lhs, relatedBy: .lessThanOrEqual, rhs: rhs)
}

public func <= (lhs: ConstraintTerm, rhs: Int) -> NSLayoutConstraint {
    return lhs <= CGFloat(rhs)
}

public func <= (lhs: ConstraintTerm, rhs: Double) -> NSLayoutConstraint {
    return lhs <= CGFloat(rhs)
}

// MARK: - c <= x
public func <= (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func <= (lhs: Int, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) <= rhs
}

public func <= (lhs: Double, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) <= rhs
}

// MARK: - x >= y
public func >= (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs: lhs, relatedBy: .greaterThanOrEqual, rhs: rhs)
}

// MARK: - x >= c
public func >= (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs: lhs, relatedBy: .greaterThanOrEqual, rhs: rhs)
}

public func >= (lhs: ConstraintTerm, rhs: Int) -> NSLayoutConstraint {
    return lhs >= CGFloat(rhs)
}

public func >= (lhs: ConstraintTerm, rhs: Double) -> NSLayoutConstraint {
    return lhs >= CGFloat(rhs)
}

// MARK: - c >= x
public func >= (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs <= lhs
}

public func >= (lhs: Int, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) >= rhs
}

public func >= (lhs: Double, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) >= rhs
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
        toItem: nil, attribute: .notAnAttribute,
        multiplier: 1.0, constant: constant)
    return constraint
}
