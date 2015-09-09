//
//  ViewController.swift
//  SampleApp-iOS
//
//  Created by fhisa on 2015/09/09.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit
import FormulaStyleConstraint

class ViewController: UIViewController {

    var baseView: UIView!
    var mainView: UIView!
    var infoView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        baseView = createView(UIColor.lightGrayColor())
        view.addSubview(baseView)
        view.addConstraints([
            baseView[.Top] == topLayoutGuide[.Bottom],
            baseView[.Bottom] == bottomLayoutGuide[.Top],
            baseView[.Leading] == view[.Leading],
            baseView[.Trailing] == view[.Trailing],
            ])

        mainView = createView(UIColor.cyanColor())
        baseView.addSubview(mainView)
        infoView = createView(UIColor.greenColor())
        baseView.addSubview(infoView)

        setupPortraitLayout()
    }

    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if size.height > size.width {
            setupPortraitLayout()
        }
        else {
            setupLandscapeLayout()
        }
    }

    private func createView(bgcolor: UIColor) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = bgcolor
        view.layer.borderColor = UIColor.redColor().CGColor
        view.layer.borderWidth = 1
        return view
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
