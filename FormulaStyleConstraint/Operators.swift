//
//  Operators.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/08/31.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit


// MARK: - operator ~
infix operator ~ {
precedence 50
associativity none
}

public func ~ (lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
    lhs.priority = rhs
    return lhs
}


// MARK: - operator +
public func + (var lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    lhs.constant += rhs
    return lhs
}

public func +(lhs: CGFloat, var rhs: ConstraintTerm) -> ConstraintTerm {
    return rhs + lhs
}

public func + (var lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs + CGFloat(rhs)
}

public func +(lhs: Int, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) + rhs
}

public func + (var lhs: ConstraintTerm, rhs: UInt) -> ConstraintTerm {
    return lhs + CGFloat(rhs)
}

public func +(lhs: UInt, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) + rhs
}

public func + (var lhs: ConstraintTerm, rhs: Float) -> ConstraintTerm {
    return lhs + CGFloat(rhs)
}

public func +(lhs: Float, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) + rhs
}

public func + (var lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs + CGFloat(rhs)
}

public func +(lhs: Double, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) + rhs
}


// MARK: - operator *
public func * (var lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    lhs.multiplier *= rhs
    lhs.constant *= rhs
    return lhs
}

public func * (lhs: CGFloat, var rhs: ConstraintTerm) -> ConstraintTerm {
    return rhs * lhs
}

public func * (var lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs * CGFloat(rhs)
}

public func * (lhs: Int, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) * rhs
}

public func * (var lhs: ConstraintTerm, rhs: UInt) -> ConstraintTerm {
    return lhs * CGFloat(rhs)
}

public func * (lhs: UInt, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) * rhs
}

public func * (var lhs: ConstraintTerm, rhs: Float) -> ConstraintTerm {
    return lhs * CGFloat(rhs)
}

public func * (lhs: Float, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) * rhs
}

public func * (var lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs * CGFloat(rhs)
}

public func * (lhs: Double, var rhs: ConstraintTerm) -> ConstraintTerm {
    return CGFloat(lhs) * rhs
}


// MARK: - operator -
public func - (var lhs: ConstraintTerm, rhs: CGFloat) -> ConstraintTerm {
    lhs.constant -= rhs
    return lhs
}

public func - (var lhs: ConstraintTerm, rhs: Int) -> ConstraintTerm {
    return lhs - CGFloat(rhs)
}

public func - (var lhs: ConstraintTerm, rhs: UInt) -> ConstraintTerm {
    return lhs - CGFloat(rhs)
}

public func - (var lhs: ConstraintTerm, rhs: Float) -> ConstraintTerm {
    return lhs - CGFloat(rhs)
}

public func - (var lhs: ConstraintTerm, rhs: Double) -> ConstraintTerm {
    return lhs - CGFloat(rhs)
}


// MARK: - operator ==
public func == (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .Equal, rhs)
}

public func == (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .Equal, rhs)
}

public func == (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs == lhs
}

public func == (lhs: ConstraintTerm, rhs: Int) -> NSLayoutConstraint {
    return lhs == CGFloat(rhs)
}

public func == (lhs: Int, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) == rhs
}

public func == (lhs: ConstraintTerm, rhs: UInt) -> NSLayoutConstraint {
    return lhs == CGFloat(rhs)
}

public func == (lhs: UInt, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) == rhs
}

public func == (lhs: ConstraintTerm, rhs: Float) -> NSLayoutConstraint {
    return lhs == CGFloat(rhs)
}

public func == (lhs: Float, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) == rhs
}

public func == (lhs: ConstraintTerm, rhs: Double) -> NSLayoutConstraint {
    return lhs == CGFloat(rhs)
}

public func == (lhs: Double, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) == rhs
}


// MARK: - operator <=
public func <= (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .LessThanOrEqual, rhs)
}

public func <= (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .LessThanOrEqual, rhs)
}

public func <= (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs >= lhs
}

public func <= (lhs: ConstraintTerm, rhs: Int) -> NSLayoutConstraint {
    return lhs <= CGFloat(rhs)
}

public func <= (lhs: Int, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) <= rhs
}

public func <= (lhs: ConstraintTerm, rhs: UInt) -> NSLayoutConstraint {
    return lhs <= CGFloat(rhs)
}

public func <= (lhs: UInt, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) <= rhs
}

public func <= (lhs: ConstraintTerm, rhs: Float) -> NSLayoutConstraint {
    return lhs <= CGFloat(rhs)
}

public func <= (lhs: Float, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) <= rhs
}

public func <= (lhs: ConstraintTerm, rhs: Double) -> NSLayoutConstraint {
    return lhs <= CGFloat(rhs)
}

public func <= (lhs: Double, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) <= rhs
}


// MARK: - operator >=
public func >= (lhs: ConstraintTerm, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .GreaterThanOrEqual, rhs)
}

public func >= (lhs: ConstraintTerm, rhs: CGFloat) -> NSLayoutConstraint {
    return createLayoutConstraint(lhs, .GreaterThanOrEqual, rhs)
}

public func >= (lhs: CGFloat, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return rhs <= lhs
}

public func >= (lhs: ConstraintTerm, rhs: Int) -> NSLayoutConstraint {
    return lhs >= CGFloat(rhs)
}

public func >= (lhs: Int, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) >= rhs
}

public func >= (lhs: ConstraintTerm, rhs: UInt) -> NSLayoutConstraint {
    return lhs >= CGFloat(rhs)
}

public func >= (lhs: UInt, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) >= rhs
}

public func >= (lhs: ConstraintTerm, rhs: Float) -> NSLayoutConstraint {
    return lhs >= CGFloat(rhs)
}

public func >= (lhs: Float, rhs: ConstraintTerm) -> NSLayoutConstraint {
    return CGFloat(lhs) >= rhs
}

public func >= (lhs: ConstraintTerm, rhs: Double) -> NSLayoutConstraint {
    return lhs >= CGFloat(rhs)
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
        toItem: nil, attribute: .NotAnAttribute,
        multiplier: 1.0, constant: constant)
    return constraint
}
