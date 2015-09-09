//
//  AppDelegate.swift
//  SampleApp Mac
//
//  Created by fhisa on 2015/09/09.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

import Cocoa
import FormulaStyleConstraint

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!

    var baseView: NSView!
    var mainView: NSView!
    var infoView: NSView!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window.delegate = self
        baseView = createView(NSColor.lightGrayColor())
        if let view = window.contentView {
            view.addSubview(baseView)
            view.addConstraints([
                baseView[.Top] == view[.Top],
                baseView[.Bottom] == view[.Bottom],
                baseView[.Leading] == view[.Leading],
                baseView[.Trailing] == view[.Trailing],
                ])

            mainView = createView(NSColor.cyanColor())
            baseView.addSubview(mainView)
            infoView = createView(NSColor.greenColor())
            baseView.addSubview(infoView)

            setupLayout()
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
    }

    func windowDidResize(notification: NSNotification) {
        setupLayout()
    }

    private func createView(bgcolor: NSColor) -> NSView {
        let view = SampleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = bgcolor
        view.borderColor = NSColor.redColor()
        return view
    }

    private func setupLayout() {
        if window.frame.size.height > window.frame.size.width {
            setupPortraitLayout()
        }
        else {
            setupLandscapeLayout()
        }
    }

    private func setupPortraitLayout() {
        baseView.removeConstraints(baseView.constraints)
        baseView.addConstraints([
            mainView[.Top] == baseView[.Top] + 8,
            mainView[.Height] * 4 == baseView[.Height] * 3,
            mainView[.Leading] == baseView[.Leading] + 8,
            mainView[.Trailing] == baseView[.Trailing] - 8,
            infoView[.Top] == mainView[.Bottom] + 8,
            infoView[.Bottom] == baseView[.Bottom] - 8,
            infoView[.Leading] == baseView[.Leading] + 8,
            infoView[.Trailing] == baseView[.Trailing] - 8,
            ])
    }

    private func setupLandscapeLayout() {
        baseView.removeConstraints(baseView.constraints)
        baseView.addConstraints([
            mainView[.Top] == baseView[.Top] + 8,
            mainView[.Bottom] == baseView[.Bottom] - 8,
            mainView[.Width] * 4 == baseView[.Width] * 3,
            mainView[.Trailing] == baseView[.Trailing] - 8,
            infoView[.Top] == baseView[.Top] + 8,
            infoView[.Bottom] == baseView[.Bottom] - 8,
            infoView[.Leading] == baseView[.Leading] + 8,
            infoView[.Trailing] == mainView[.Leading] - 8,
            ])
    }
}

