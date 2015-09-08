//
//  ConstraintTerm.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit

public struct ConstraintTerm
{
    let view: AnyObject?
    let attribute: NSLayoutAttribute
    var multiplier: CGFloat
    var constant: CGFloat

    public init(
        view v: AnyObject? = nil,
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
