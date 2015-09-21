//
//  OperatorsWithViewTestsTests.swift
//  FormulaStyleConstraintTests
//
//  Created by fhisa on 2015/08/13.
//  Copyright (c) 2015 Hisakuni Fujimoto. All rights reserved.
//

#if os(iOS)
    import UIKit
    #else
    import AppKit
#endif

import XCTest
import FormulaStyleConstraint

class OperatorsWithUIViewTests: XCTestCase {

    var view1: View!
    var view2: View!
    var x: NSLayoutConstraint!

    override func setUp() {
        super.setUp()
        x = nil
        view1 = View()
        view2 = View()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_priority_operator() {
        x = view1[.Width] == view2[.Width]
        XCTAssertEqual(x.priority,  LayoutPriority(1000))
        x = view1[.Width] == view2[.Width] ~ 750
        XCTAssertEqual(x.priority,  LayoutPriority(750))

        x = view1[.Width] == view2[.Width] ~ 750.0
        XCTAssertEqual(x.priority,  LayoutPriority(750.0))

        let intval = 750
        x = view1[.Width] == view2[.Width] ~ intval
        XCTAssertEqual(x.priority,  LayoutPriority(intval))

        let floatval = 750.0
        x = view1[.Width] == view2[.Width] ~ floatval
        XCTAssertEqual(x.priority,  LayoutPriority(floatval))
    }

    func test_operator_term_add_constant() {
        x = view1[.Width] == view2[.Width] + 20
        XCTAssertEqual(x.constant,  CGFloat(20))

        x = view1[.Width] == view2[.Width] + 20.0
        XCTAssertEqual(x.constant,  CGFloat(20.0))

        let intval = 20
        x = view1[.Width] == view2[.Width] + intval
        XCTAssertEqual(x.constant,  CGFloat(intval))
        x = view1[.Width] == view2[.Width] + intval + intval
        XCTAssertEqual(x.constant,  CGFloat(intval * 2))

        let floatval = 20.0
        x = view1[.Width] == view2[.Width] + floatval
        XCTAssertEqual(x.constant,  CGFloat(floatval))
        x = view1[.Width] == view2[.Width] + floatval + floatval
        XCTAssertEqual(x.constant,  CGFloat(floatval * 2))
    }

    func test_operator_constant_add_term() {
        x = view1[.Width] == 20 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(20))

        x = view1[.Width] == 20.0 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(20.0))

        let intval = 20
        x = view1[.Width] == intval + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(intval))
        x = view1[.Width] == intval + 20 + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(intval + 20))

        let floatval = 20.0
        x = view1[.Width] == floatval + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(floatval))
        x = view1[.Width] == 10.0 + floatval + view2[.Width]
        XCTAssertEqual(x.constant,  CGFloat(10.0 + floatval))
    }

    func test_operator_term_multiply_constant() {
        x = view1[.Width] == view2[.Width] * 20
        XCTAssertEqual(x.multiplier,  CGFloat(20))

        x = view1[.Width] == view2[.Width] * 20.0
        XCTAssertEqual(x.multiplier,  CGFloat(20.0))

        let intval = 20
        x = view1[.Width] == view2[.Width] * intval
        XCTAssertEqual(x.multiplier,  CGFloat(intval))

        let floatval = 20.0
        x = view1[.Width] == view2[.Width] * floatval
        XCTAssertEqual(x.multiplier,  CGFloat(floatval))
    }

    func test_operator_constant_multiply_term() {
        x = view1[.Width] == 20 * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(20))

        x = view1[.Width] == 20.0 * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(20.0))

        let intval = 20
        x = view1[.Width] == intval * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(intval))

        let floatval = 20.0
        x = view1[.Width] == floatval * view2[.Width]
        XCTAssertEqual(x.multiplier,  CGFloat(floatval))
    }

    func test_operator_multiply_for_ratio() {
        x = view1[.Height] * 4 == view1[.Width] * 3
        XCTAssertEqual(x.multiplier,  CGFloat(3) / CGFloat(4))
        x = view1[.Height] * 16.0 == view1[.Width] * 9.0
        XCTAssertEqual(x.multiplier,  CGFloat(9.0) / CGFloat(16.0))

        let intval_a = 4, intval_b = 3
        x = view1[.Height] * intval_a == view1[.Width] * intval_b
        XCTAssertEqual(x.multiplier,  CGFloat(intval_b) / CGFloat(intval_a))

        let floatval_a = 16.0, floatval_b = 9.0
        x = view1[.Height] * floatval_a == view1[.Width] * floatval_b
        XCTAssertEqual(x.multiplier,  CGFloat(floatval_b / floatval_a))
    }

    func test_operator_term_subtract_constant() {
        x = view1[.Width] == view2[.Width] - 20
        XCTAssertEqual(x.constant,  CGFloat(-20))

        x = view1[.Width] == view2[.Width] - 20.0
        XCTAssertEqual(x.constant,  CGFloat(-20.0))

        let intval = 20
        x = view1[.Width] == view2[.Width] - intval
        XCTAssertEqual(x.constant,  CGFloat(-intval))

        let floatval = 20.0
        x = view1[.Width] == view2[.Width] - floatval
        XCTAssertEqual(x.constant,  CGFloat(-floatval))
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

        let intval = 1234
        x = view1[.Width] == intval
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = view1[.Width] == floatval
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
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

        let intval = 1234
        x = intval == view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = intval == view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.Equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
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

        let intval = 1234
        x = view1[.Width] <= intval
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = view1[.Width] <= intval
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
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

        let intval = 1234
        x = intval <= view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = floatval <= view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
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

        let intval = 1234
        x = view1[.Width] >= intval
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = view1[.Width] >= floatval
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
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

        let intval = 1234
        x = intval >= view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = floatval >= view1[.Width]
        XCTAssertTrue(x.isKindOfClass(NSLayoutConstraint))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(x.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
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
