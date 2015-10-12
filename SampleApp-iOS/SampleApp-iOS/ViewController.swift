//
//  ViewController.swift
//  SampleApp-iOS
//
//  Created by fhisa on 2015/10/12.
//  Copyright (C) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit
import SwiftyLayout

class ViewController: UIViewController {

    private var v1: UIView!
    private var v2: UIView!

    private var constraints: [NSLayoutConstraint]?

    override func viewDidLoad() {
        super.viewDidLoad()
        v1 = createSubView(UIColor.greenColor())
        v2 = createSubView(UIColor.cyanColor())
        if view.bounds.size.height > view.bounds.size.width {
            setupPortrait()
        }
        else {
            setupLandscape()
        }
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        if size.height > size.width {
            setupPortrait()
        }
        else {
            setupLandscape()
        }
    }

    private func createSubView(color: UIColor) -> UIView {
        let v = UIView()
        view.addSubview(v)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = color
        let size = min(view.bounds.size.width, view.bounds.size.height) / 3.0
        v.addConstraint(v[.Width] == size)
        v.addConstraint(v[.Height] == size)
        return v
    }

    private func setupPortrait() {
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

    private func setupLandscape() {
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
