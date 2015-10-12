//
//  AppDelegate.swift
//  SampleApp-Mac
//
//  Created by fhisa on 2015/10/12.
//  Copyright (C) 2015 Hisakuni Fujimoto. All rights reserved.
//

import Cocoa
import SwiftyLayout

class SampleView: NSView {
    var backgroundColor: NSColor = NSColor.grayColor()

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
        let path = NSBezierPath(rect: dirtyRect)
        backgroundColor.set()
        path.fill()
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window.delegate = self
        v1 = createSubView(NSColor.greenColor())
        v2 = createSubView(NSColor.cyanColor())
        setupLayout()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    func windowDidResize(notification: NSNotification) {
        setupLayout()
    }

    private func setupLayout() {
        if window.frame.size.height > window.frame.size.width {
            setupPortrait()
        }
        else {
            setupLandscape()
        }
    }

    private var v1: SampleView!
    private var v2: SampleView!

    private var constraints: [NSLayoutConstraint]?

    private func createSubView(color: NSColor) -> SampleView {
        let v = SampleView()
        if let view = window.contentView {
            view.addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = color
            let size = min(view.bounds.size.width, view.bounds.size.height) / 3.0
            v.addConstraint(v[.Width] == size)
            v.addConstraint(v[.Height] == size)
        }
        return v
    }

    private func setupPortrait() {
        if let view = window.contentView {
            if let cs = constraints { view.removeConstraints(cs) }
            let cs: [NSLayoutConstraint] = [
                v1[.CenterX] == view[.CenterX],
                v2[.CenterX] == view[.CenterX],
                v1[.CenterY] == view[.CenterY] * (1.0 / 2.0),
                v2[.CenterY] == view[.CenterY] * (3.0 / 2.0),
            ]
            constraints = cs
            view.addConstraints(constraints!)
        }
    }

    private func setupLandscape() {
        if let view = window.contentView {
            if let cs = constraints { view.removeConstraints(cs) }
            let cs: [NSLayoutConstraint] = [
                v1[.CenterY] == view[.CenterY],
                v2[.CenterY] == view[.CenterY],
                v1[.CenterX] == view[.CenterX] * (1.0 / 2.0),
                v2[.CenterX] == view[.CenterX] * (3.0 / 2.0),
            ]
            constraints = cs
            view.addConstraints(constraints!)
        }
    }
}

