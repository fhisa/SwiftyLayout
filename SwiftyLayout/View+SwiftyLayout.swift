//
//  View+SwiftyLayout.swift
//  SwiftyLayout
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

#if os(iOS)
    import UIKit
    public extension UIView {

        public func layout(attribute: NSLayoutAttribute) -> ConstraintTerm {
            return ConstraintTerm(view: self, attribute: attribute)
        }

        public subscript(attribute: NSLayoutAttribute) -> ConstraintTerm {
            return layout(attribute: attribute)
        }
    }

    #else
    import AppKit
    public extension NSView {

        public func layout(attribute: NSLayoutAttribute) -> ConstraintTerm {
            return ConstraintTerm(view: self, attribute: attribute)
        }

        public subscript(attribute: NSLayoutAttribute) -> ConstraintTerm {
            return layout(attribute: attribute)
        }
    }
#endif
