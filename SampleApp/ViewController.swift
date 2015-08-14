//
//  ViewController.swift
//  SampleApp
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit
import FormulaStyleConstraint

class ViewController: UIViewController {

    @IBOutlet weak var rootView: UIView!

    private var rightView: UIView!
    private var leftTopView: UIView!
    private var leftBtmView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        func createView(bgcolor: UIColor) -> UIView {
            let view = UIView()
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.backgroundColor = bgcolor
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.redColor().CGColor
            rootView.addSubview(view)
            return view
        }

        rightView = createView(UIColor.cyanColor())
        leftTopView = createView(UIColor.greenColor())
        leftBtmView = createView(UIColor.orangeColor())
    }

    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        println(__FUNCTION__)
        let hSizeClass = traitCollection.horizontalSizeClass
        let vSizeClass = traitCollection.verticalSizeClass
        if hSizeClass == .Compact && vSizeClass == .Regular {
            setupSingleLayout()
        }
        else {
            setupTileLayout()
        }
    }

    private func setupTileLayout() {
        rootView.removeConstraints(rootView.constraints())
        rootView.addConstraints([
            rightView[.Top] == rootView[.Top] + 4.0,
            rightView[.Trailing] == rootView[.Trailing] - 4.0,
            rightView[.Bottom] == rootView[.Bottom] - 4.0,
            rightView[.Width] == 0.5 * rootView[.Width] - 6.0,
            ])
        leftTopView.hidden = false
        rootView.addConstraints([
            leftTopView[.Top] == rootView[.Top] + 4.0,
            leftTopView[.Leading] == rootView[.Leading] + 4.0,
            leftTopView[.Width] == 0.5 * rootView[.Width] - 6.0,
            leftTopView[.Height] == 0.5 * rootView[.Height] - 6.0,
            ])
        leftBtmView.hidden = false
        rootView.addConstraints([
            leftBtmView[.Leading] == rootView[.Leading] + 4.0,
            leftBtmView[.Bottom] == rootView[.Bottom] + -4.0,
            leftBtmView[.Width] == 0.5 * rootView[.Width] - 6.0,
            leftBtmView[.Height] == 0.5 * rootView[.Height] - 6.0,
            ])
    }

    private func setupSingleLayout() {
        rootView.removeConstraints(rootView.constraints())
        rootView.addConstraints([
            rightView[.Top] == rootView[.Top] + 4.0,
            rightView[.Trailing] == rootView[.Trailing] - 4.0,
            rightView[.Bottom] == rootView[.Bottom] - 4.0,
            rightView[.Width] == rootView[.Width] - 8.0,
            ])
        leftTopView.hidden = true
        leftBtmView.hidden = true
    }
}

