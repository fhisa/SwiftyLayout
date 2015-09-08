//
//  OperatorsWithUILayoutSupportTests.swift
//  FormulaStyleConstraint
//
//  Created by fhisa on 2015/09/08.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit
import XCTest
import FormulaStyleConstraint

class OperatorsWithUILayoutSupportTests: XCTestCase {

    var view1: UIView!
    var view2: UIView!
    var vc: UIViewController!
    var x: NSLayoutConstraint!

    override func setUp() {
        super.setUp()
        x = nil
        view1 = UIView()
        view2 = UIView()
        vc = UIViewController()
        vc.view = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_priority_operator() {
        x = vc.topLayoutGuide[.Width] == view2[.Width]
        XCTAssertEqual(x.priority,  UILayoutPriority(1000))
        x = vc.bottomLayoutGuide[.Width] == view2[.Width] ~ 750
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
        x = view1[.Width] == vc.topLayoutGuide[.Width] ~ 750.0
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
        x = view1[.Width] == vc.bottomLayoutGuide[.Width] ~ 750.0
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
    }

    func test_operator_term_add_constant() {
        x = vc.topLayoutGuide[.Width] == view2[.Width] + 20
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = vc.bottomLayoutGuide[.Width] == view2[.Width] + 20.0
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.Width] == vc.topLayoutGuide[.Width] + 10 + 20
        XCTAssertEqual(x.constant,  CGFloat(30))
        x = view1[.Width] == vc.bottomLayoutGuide[.Width] + 10.0 + 20
        XCTAssertEqual(x.constant,  CGFloat(30))
    }

    func test_operator_constant_add_term() {
        x = vc.topLayoutGuide[.Width] == 20 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = vc.bottomLayoutGuide[.Width] == 20.0 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.Width] == 10 + 20 + vc.topLayoutGuide[.Width]
        XCTAssertEqual(x.constant,  CGFloat(30))
        x = view1[.Width] == 10.0 + 20 + vc.bottomLayoutGuide[.Width]
        XCTAssertEqual(x.constant,  CGFloat(30))
    }

    func test_operator_term_multiply_constant() {
        x = vc.topLayoutGuide[.Width] == view2[.Width] * 2
        XCTAssertEqual(x.multiplier,  CGFloat(2))
        x = view1[.Width] == vc.bottomLayoutGuide[.Width] * 2.0
        XCTAssertEqual(x.multiplier,  CGFloat(2))
    }

    func test_operator_constant_multiply_term() {
        x = vc.topLayoutGuide[.Width] == 2 * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(2))
        x = view1[.Width] == 2.0 * vc.bottomLayoutGuide[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(2))
    }

    func test_operator_multiply_for_ratio() {
        x = vc.topLayoutGuide[.Height] * 4 == view1[.Width] * 3
        XCTAssertEqual(x.multiplier,  CGFloat(3.0 / 4.0))
        x = view1[.Height] * 16.0 == vc.bottomLayoutGuide[.Width] * 9.0
        XCTAssertEqual(x.multiplier,  CGFloat(9.0 / 16.0))
    }

    func test_operator_term_subtract_constant() {
        x = vc.topLayoutGuide[.Width] == view2[.Width] - 2
        XCTAssertEqual(x.constant,  CGFloat(-2))
        x = view1[.Width] == vc.bottomLayoutGuide[.Width] - 2.0
        XCTAssertEqual(x.constant,  CGFloat(-2.0))
    }

    func test_operator_term_equal_term() {
        x = view1[.Width] == 12 * vc.topLayoutGuide[.Width] + 34
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(vc.topLayoutGuide.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_less_than_or_equal_term() {
        x = view1[.Width] <= 12 * vc.topLayoutGuide[.Width] + 34
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertTrue(vc.topLayoutGuide.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_greater_than_or_equal_term() {
        x = view1[.Width] >= 12 * vc.bottomLayoutGuide[.Width] + 34
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertTrue(vc.bottomLayoutGuide.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }
}
