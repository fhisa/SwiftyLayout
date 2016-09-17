//
//  OperatorsWithUILayoutSupportTests.swift
//  SwiftyLayoutTests
//
//  Created by fhisa on 2015/09/08.
//  Copyright (C) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit

import XCTest
import SwiftyLayout

class OperatorsWithUILayoutSupportTests: XCTestCase {

    var view1: View!
    var view2: View!
    var vc: ViewController!
    var x: NSLayoutConstraint!

    override func setUp() {
        super.setUp()
        x = nil
        view1 = View()
        view2 = View()
        vc = ViewController()
        vc.view = View()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_priority_operator() {
        x = vc.topLayoutGuide[.width] == view2[.width]
        XCTAssertEqual(x.priority,  UILayoutPriority(1000))
        x = (vc.bottomLayoutGuide[.width] == view2[.width]) ~ 750
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
        x = (view1[.width] == vc.topLayoutGuide[.width]) ~ 750.0
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
        x = (view1[.width] == vc.bottomLayoutGuide[.width]) ~ 750.0
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
    }

    func test_operator_term_add_constant() {
        x = vc.topLayoutGuide[.width] == view2[.width] + 20
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = vc.bottomLayoutGuide[.width] == view2[.width] + 20.0
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.width] == vc.topLayoutGuide[.width] + 10 + 20
        XCTAssertEqual(x.constant,  CGFloat(30))
        x = view1[.width] == vc.bottomLayoutGuide[.width] + 10.0 + 20
        XCTAssertEqual(x.constant,  CGFloat(30))
    }

    func test_operator_constant_add_term() {
        x = vc.topLayoutGuide[.width] == 20 + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = vc.bottomLayoutGuide[.width] == 20.0 + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.width] == 10 + 20 + vc.topLayoutGuide[.width]
        XCTAssertEqual(x.constant,  CGFloat(30))
        x = view1[.width] == 10.0 + 20 + vc.bottomLayoutGuide[.width]
        XCTAssertEqual(x.constant,  CGFloat(30))
    }

    func test_operator_term_multiply_constant() {
        x = vc.topLayoutGuide[.width] == view2[.width] * 2
        XCTAssertEqual(x.multiplier,  CGFloat(2))
        x = view1[.width] == vc.bottomLayoutGuide[.width] * 2.0
        XCTAssertEqual(x.multiplier,  CGFloat(2))
    }

    func test_operator_constant_multiply_term() {
        x = vc.topLayoutGuide[.width] == 2 * view2[.width]
        XCTAssertEqual(x.multiplier,  CGFloat(2))
        x = view1[.width] == 2.0 * vc.bottomLayoutGuide[.width]
        XCTAssertEqual(x.multiplier,  CGFloat(2))
    }

    func test_operator_multiply_for_ratio() {
        x = vc.topLayoutGuide[.height] * 4 == view1[.width] * 3
        XCTAssertEqual(x.multiplier,  CGFloat(3.0 / 4.0))
        x = view1[.height] * 16.0 == vc.bottomLayoutGuide[.width] * 9.0
        XCTAssertEqual(x.multiplier,  CGFloat(9.0 / 16.0))
    }

    func test_operator_term_subtract_constant() {
        x = vc.topLayoutGuide[.width] == view2[.width] - 2
        XCTAssertEqual(x.constant,  CGFloat(-2))
        x = view1[.width] == vc.bottomLayoutGuide[.width] - 2.0
        XCTAssertEqual(x.constant,  CGFloat(-2.0))
    }

    func test_operator_term_divde_constant() {
        x = vc.topLayoutGuide[.width] == view2[.width] / 2
        XCTAssertEqual(x.multiplier,  CGFloat(0.5))
        x = view1[.width] == vc.bottomLayoutGuide[.width] / 2.0
        XCTAssertEqual(x.multiplier,  CGFloat(0.5))
    }

    func test_operator_term_equal_term() {
        x = view1[.width] == 12 * vc.topLayoutGuide[.width] + 34
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertTrue(vc.topLayoutGuide.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_less_than_or_equal_term() {
        x = view1[.width] <= 12 * vc.topLayoutGuide[.width] + 34
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertTrue(vc.topLayoutGuide.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_greater_than_or_equal_term() {
        x = view1[.width] >= 12 * vc.bottomLayoutGuide[.width] + 34
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertTrue(vc.bottomLayoutGuide.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }
}
