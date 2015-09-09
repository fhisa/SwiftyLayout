//
//  View+FormulaStyleConstraint.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

#if os(iOS)

    import UIKit
    private typealias View = UIView

    #else

    import AppKit
    private typealias View = NSView

#endif

public extension View {

    public func layout(attribute: NSLayoutAttribute) -> ConstraintTerm {
        return ConstraintTerm(view: self, attribute: attribute)
    }

    public subscript(attribute: NSLayoutAttribute) -> ConstraintTerm {
        return layout(attribute)
    }
}
