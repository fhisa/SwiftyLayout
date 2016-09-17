//
//  OperatorsWithViewTestsTests.swift
//  SwiftyLayoutTests
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
import SwiftyLayout

class OperatorsWithViewTests: XCTestCase {

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
        x = view1[.width] == view2[.width]
        XCTAssertEqual(x.priority,  LayoutPriority(1000))
        x = (view1[.width] == view2[.width]) ~ 750
        XCTAssertEqual(x.priority,  LayoutPriority(750))

        x = (view1[.width] == view2[.width]) ~ 750.0
        XCTAssertEqual(x.priority,  LayoutPriority(750.0))

        let intval = 750
        x = (view1[.width] == view2[.width]) ~ intval
        XCTAssertEqual(x.priority,  LayoutPriority(intval))

        let floatval = 750.0
        x = (view1[.width] == view2[.width]) ~ floatval
        XCTAssertEqual(x.priority,  LayoutPriority(floatval))
    }

    func test_operator_term_add_constant() {
        x = view1[.width] == view2[.width] + 20
        XCTAssertEqual(x.constant,  CGFloat(20))

        x = view1[.width] == view2[.width] + 20.0
        XCTAssertEqual(x.constant,  CGFloat(20.0))

        let intval = 20
        x = view1[.width] == view2[.width] + intval
        XCTAssertEqual(x.constant,  CGFloat(intval))
        x = view1[.width] == view2[.width] + intval + intval
        XCTAssertEqual(x.constant,  CGFloat(intval * 2))

        let floatval = 20.0
        x = view1[.width] == view2[.width] + floatval
        XCTAssertEqual(x.constant,  CGFloat(floatval))
        x = view1[.width] == view2[.width] + floatval + floatval
        XCTAssertEqual(x.constant,  CGFloat(floatval * 2))
    }

    func test_operator_constant_add_term() {
        x = view1[.width] == 20 + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(20))

        x = view1[.width] == 20.0 + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(20.0))

        let intval = 20
        x = view1[.width] == intval + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(intval))
        x = view1[.width] == intval + 20 + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(intval + 20))

        let floatval = 20.0
        x = view1[.width] == floatval + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(floatval))
        x = view1[.width] == 10.0 + floatval + view2[.width]
        XCTAssertEqual(x.constant,  CGFloat(10.0 + floatval))
    }

    func test_operator_term_multiply_constant() {
        x = view1[.width] == view2[.width] * 20
        XCTAssertEqual(x.multiplier,  CGFloat(20))

        x = view1[.width] == view2[.width] * 20.0
        XCTAssertEqual(x.multiplier,  CGFloat(20.0))

        let intval = 20
        x = view1[.width] == view2[.width] * intval
        XCTAssertEqual(x.multiplier,  CGFloat(intval))

        let floatval = 20.0
        x = view1[.width] == view2[.width] * floatval
        XCTAssertEqual(x.multiplier,  CGFloat(floatval))
    }

    func test_operator_constant_multiply_term() {
        x = view1[.width] == 20 * view2[.width]
        XCTAssertEqual(x.multiplier,  CGFloat(20))

        x = view1[.width] == 20.0 * view2[.width]
        XCTAssertEqual(x.multiplier,  CGFloat(20.0))

        let intval = 20
        x = view1[.width] == intval * view2[.width]
        XCTAssertEqual(x.multiplier,  CGFloat(intval))

        let floatval = 20.0
        x = view1[.width] == floatval * view2[.width]
        XCTAssertEqual(x.multiplier,  CGFloat(floatval))
    }

    func test_operator_multiply_for_ratio() {
        x = view1[.height] * 4 == view1[.width] * 3
        XCTAssertEqual(x.multiplier,  CGFloat(3) / CGFloat(4))
        x = view1[.height] * 16.0 == view1[.width] * 9.0
        XCTAssertEqual(x.multiplier,  CGFloat(9.0) / CGFloat(16.0))

        let intval_a = 4, intval_b = 3
        x = view1[.height] * intval_a == view1[.width] * intval_b
        XCTAssertEqual(x.multiplier,  CGFloat(intval_b) / CGFloat(intval_a))

        let floatval_a = 16.0, floatval_b = 9.0
        x = view1[.height] * floatval_a == view1[.width] * floatval_b
        XCTAssertEqual(x.multiplier,  CGFloat(floatval_b / floatval_a))
    }

    func test_operator_term_subtract_constant() {
        x = view1[.width] == view2[.width] - 20
        XCTAssertEqual(x.constant,  CGFloat(-20))

        x = view1[.width] == view2[.width] - 20.0
        XCTAssertEqual(x.constant,  CGFloat(-20.0))

        let intval = 20
        x = view1[.width] == view2[.width] - intval
        XCTAssertEqual(x.constant,  CGFloat(-intval))

        let floatval = 20.0
        x = view1[.width] == view2[.width] - floatval
        XCTAssertEqual(x.constant,  CGFloat(-floatval))
    }

    func test_operator_term_divide_constant() {
        x = view1[.width] == view2[.width] / 2
        XCTAssertEqual(x.multiplier,  CGFloat(0.5))

        x = view1[.width] == view2[.width] / 2.0
        XCTAssertEqual(x.multiplier,  CGFloat(0.5))

        let intval = 2
        x = view1[.width] == view2[.width] / intval
        XCTAssertEqual(x.multiplier,  CGFloat(1) / CGFloat(intval))

        let floatval = 2.0
        x = view1[.width] == view2[.width] / floatval
        XCTAssertEqual(x.multiplier,  CGFloat(1.0 / floatval))
    }

    func test_operator_divide_for_ratio() {
        x = view1[.height] / 3 == view1[.width] / 4
        XCTAssertEqual(x.multiplier,  CGFloat(3) / CGFloat(4))
        x = view1[.height] / 9.0 == view1[.width] / 16.0
        XCTAssertEqual(x.multiplier,  CGFloat(9.0) / CGFloat(16.0))

        let intval_a = 3, intval_b = 4
        x = view1[.height] / intval_a == view1[.width] / intval_b
        XCTAssertEqual(x.multiplier,  CGFloat(intval_a) / CGFloat(intval_b))

        let floatval_a = 9.0, floatval_b = 16.0
        x = view1[.height] / floatval_a == view1[.width] / floatval_b
        XCTAssertEqual(x.multiplier,  CGFloat(floatval_a / floatval_b))
    }

    func test_operator_term_equal_constant() {
        x = view1[.width] == 1234
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))

        let intval = 1234
        x = view1[.width] == intval
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = view1[.width] == floatval
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
    }

    func test_operator_constant_equal_term() {
        x = 1234 == view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))

        let intval = 1234
        x = intval == view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = intval == view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
    }

    func test_operator_term_equal_term() {
        x = view1[.width] == 12 * view2[.width] + 34
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.equal)
        XCTAssertTrue(view2.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_less_than_or_equal_constant() {
        x = view1[.width] <= 1234
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))

        let intval = 1234
        x = view1[.width] <= intval
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = view1[.width] <= intval
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
    }

    func test_operator_constant_less_than_or_equal_term() {
        x = 1234 <= view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))

        let intval = 1234
        x = intval <= view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = floatval <= view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
    }

    func test_operator_term_less_than_or_equal_term() {
        x = view1[.width] <= 12 * view2[.width] + 34
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertTrue(view2.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }

    func test_operator_term_greater_than_or_equal_constant() {
        x = view1[.width] >= 1234
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))

        let intval = 1234
        x = view1[.width] >= intval
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = view1[.width] >= floatval
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
    }

    func test_operator_constant_greater_than_or_equal_term() {
        x = 1234 >= view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(1234))

        let intval = 1234
        x = intval >= view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(intval))

        let floatval = 1234.0
        x = floatval >= view1[.width]
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.lessThanOrEqual)
        XCTAssertNil(x.secondItem)
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.notAnAttribute)
        XCTAssertEqual(x.multiplier, CGFloat(1))
        XCTAssertEqual(x.constant, CGFloat(floatval))
    }

    func test_operator_term_greater_than_or_equal_term() {
        x = view1[.width] >= 12 * view2[.width] + 34
        XCTAssertTrue(x.isKind(of: NSLayoutConstraint.self))
        XCTAssertTrue(view1.isEqual(x.firstItem))
        XCTAssertEqual(x.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.relation, NSLayoutRelation.greaterThanOrEqual)
        XCTAssertTrue(view2.isEqual(x.secondItem))
        XCTAssertEqual(x.secondAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(x.multiplier, CGFloat(12))
        XCTAssertEqual(x.constant, CGFloat(34))
    }
}
