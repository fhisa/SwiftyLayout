//
//  SampleView.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/09/09.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

import Cocoa

class SampleView: NSView {

    var backgroundColor: NSColor?
    var borderColor: NSColor?

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        let path = NSBezierPath(rect: bounds)
        if let color = backgroundColor {
            color.setFill()
            path.fill()
        }
        if let color = borderColor {
            color.setStroke()
            path.stroke()
        }
    }
}
