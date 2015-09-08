//
//  UILayoutSupport+FormulaStyleConstraint.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/09/08.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit

public extension UILayoutSupport {
    public func layout(attribute: NSLayoutAttribute) -> ConstraintTerm {
        return ConstraintTerm(view: self, attribute: attribute)
    }

    public subscript(attribute: NSLayoutAttribute) -> ConstraintTerm {
        return layout(attribute)
    }
}
