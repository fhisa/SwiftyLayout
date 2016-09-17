//
//  UILayoutSupport+SwiftyLayout.swift
//  SwiftyLayout
//
//  Created by fhisa on 2015/09/08.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UILayoutSupport {
    public func layout(attribute: NSLayoutAttribute) -> ConstraintTerm {
        return ConstraintTerm(view: self, attribute: attribute)
    }

    public subscript(attribute: NSLayoutAttribute) -> ConstraintTerm {
        return layout(attribute: attribute)
    }
}
#endif
