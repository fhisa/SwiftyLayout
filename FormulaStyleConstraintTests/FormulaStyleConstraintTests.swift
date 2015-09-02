//
//  FormulaStyleConstraintTests.swift
//  FormulaStyleConstraintTests
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

import UIKit
import XCTest
import FormulaStyleConstraint

class FormulaStyleConstraintTests: XCTestCase {

    var view1: UIView!
    var view2: UIView!
    var x: NSLayoutConstraint!

    override func setUp() {
        super.setUp()
        x = nil
        view1 = UIView()
        view2 = UIView()
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)
        view2.setTranslatesAutoresizingMaskIntoConstraints(false)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_priority_operator() {
        x = view1[.Width] == view2[.Width]
        XCTAssertEqual(x.priority,  UILayoutPriority(1000))
        x = view1[.Width] == view2[.Width] ~ 750
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
        x = view1[.Width] == view2[.Width] ~ 750.0
        XCTAssertEqual(x.priority,  UILayoutPriority(750))
    }

    func test_operator_term_add_constant() {
        x = view1[.Width] == view2[.Width] + 20
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.Width] == view2[.Width] + 20.0
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.Width] == view2[.Width] + 10 + 20
        XCTAssertEqual(x.constant,  CGFloat(30))
        x = view1[.Width] == view2[.Width] + 10.0 + 20
        XCTAssertEqual(x.constant,  CGFloat(30))
    }

    func test_operator_constant_add_term() {
        x = view1[.Width] == 20 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.Width] == 20.0 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(20))
        x = view1[.Width] == 10 + 20 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(30))
        x = view1[.Width] == 10.0 + 20 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(30))
    }

    func test_operator_term_multiply_constant() {
        x = view1[.Width] == view2[.Width] * 2
        XCTAssertEqual(x.multiplier,  CGFloat(2))
        x = view1[.Width] == view2[.Width] * 2.0
        XCTAssertEqual(x.multiplier,  CGFloat(2))
    }

    func test_operator_constant_multiply_term() {
        x = view1[.Width] == 2 * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(2))
        x = view1[.Width] == 2.0 * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(2))
    }

    func test_operator_multiply_for_ratio() {
        x = view1[.Height] * 4 == view1[.Width] * 3
        XCTAssertEqual(x.multiplier,  CGFloat(3.0 / 4.0))
        x = view1[.Height] * 16.0 == view1[.Width] * 9.0
        XCTAssertEqual(x.multiplier,  CGFloat(9.0 / 16.0))
    }

    func test_operator_term_subtract_constant() {
        x = view1[.Width] == view2[.Width] - 2
        XCTAssertEqual(x.constant,  CGFloat(-2))
        x = view1[.Width] == view2[.Width] - 2.0
        XCTAssertEqual(x.constant,  CGFloat(-2.0))
    }

    func test_operator_term_equal_constant() {
        x = view1[.Width] == 1234
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))
    }

    func test_operator_constant_equal_term() {
        x = 1234 == view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))
    }

    func test_operator_term_equal_term() {
        x = view1[.Width] == 12 * view2[.Width] + 34
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_less_than_or_equal_constant() {
        x = view1[.Width] <= 1234
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))
    }

    func test_operator_constant_less_than_or_equal_term() {
        x = 1234 <= view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))
    }

    func test_operator_term_less_than_or_equal_term() {
        x = view1[.Width] <= 12 * view2[.Width] + 34
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertTrue(view2.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_greater_than_or_equal_constant() {
        x = view1[.Width] >= 1234
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))
    }

    func test_operator_constant_greater_than_or_equal_term() {
        x = 1234 >= view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))
    }

    func test_operator_term_greater_than_or_equal_term() {
        x = view1[.Width] >= 12 * view2[.Width] + 34
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertTrue(view2.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }
}
