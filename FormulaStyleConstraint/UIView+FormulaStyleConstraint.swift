//
//  UIView+FormulaStyleConstraint.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit

public extension UIView {
    public func layout(attribute: NSLayoutAttribute) -> LayoutTerm {
        return LayoutTerm(view: self, attribute: attribute)
    }

    public subscript(attribute: NSLayoutAttribute) -> LayoutTerm {
        return layout(attribute)
    }
}

