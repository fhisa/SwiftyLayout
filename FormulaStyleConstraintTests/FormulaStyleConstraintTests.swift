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

    override func setUp() {
        super.setUp()
        view1 = UIView()
        view2 = UIView()
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)
        view2.setTranslatesAutoresizingMaskIntoConstraints(false)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_view1_equal_view2() {
        let constraint = (view1[.Width] == view2[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(1.0))
        XCTAssertEqual(constraint.constant, CGFloat(0.0))
    }

    func test_view1_less_than_or_equal_view2() {
        let constraint = (view1[.Width] <= view2[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(1.0))
        XCTAssertEqual(constraint.constant, CGFloat(0.0))
    }

    func test_view1_greater_than_or_equal_view2() {
        let constraint = (view1[.Width] >= view2[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(1.0))
        XCTAssertEqual(constraint.constant, CGFloat(0.0))
    }

    func test_view1_equal_constant() {
        var constraint = (view1[.Width] == 12345.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, CGFloat(12345.0))
    }

    func test_view1_less_than_or_equal_constant() {
        let constraint = (view1[.Width] <= 12345.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, CGFloat(12345.0))
    }

    func test_view1_greater_than_or_equal_constant() {
        let constraint = (view1[.Width] >= 12345.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, CGFloat(12345.0))
    }

    func test_constant_equal_view1() {
        let constraint = (12345.0 == view1[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, CGFloat(12345.0))
    }

    func test_constant_less_than_or_equal_view1() {
        let constraint = (12345.0 <= view1[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, CGFloat(12345.0))
    }

    func test_constant_greater_than_or_equal_view1() {
        let constraint = (12345.0 >= view1[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, CGFloat(12345.0))
    }

    func test_view1_equal_constant_multiply_view2() {
        let constraint = (view1[.Width] == 0.5 * view2[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(0.5))
        XCTAssertEqual(constraint.constant, CGFloat(0.0))
    }

    func test_view1_equal_view2_multiply_constant() {
        let constraint = (view1[.Width] == view2[.Width] * 0.5)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(0.5))
        XCTAssertEqual(constraint.constant, CGFloat(0.0))
    }

    func test_view1_equal_view2_add_constant() {
        let constraint = (view1[.Width] == view2[.Width] + 4.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(1.0))
        XCTAssertEqual(constraint.constant, CGFloat(4.0))
    }

    func test_view1_equal_constant_add_view2() {
        let constraint = (view1[.Width] == 4.0 + view2[.Width])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(1.0))
        XCTAssertEqual(constraint.constant, CGFloat(4.0))
    }

    func test_view1_equal_view2_subtract_constant() {
        let constraint = (view1[.Width] == view2[.Width] - 4.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(1.0))
        XCTAssertEqual(constraint.constant, CGFloat(-4.0))
    }

    func test_view1_equal_constant_multiply_view2_add_constant() {
        let constraint = (view1[.Width] == 0.5 * view2[.Width] + 4.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(0.5))
        XCTAssertEqual(constraint.constant, CGFloat(4.0))
    }

    func test_view1_equal_view2_multiply_constant_add_constant() {
        let constraint = (view1[.Width] == view2[.Width] * 0.5 + 4.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(0.5))
        XCTAssertEqual(constraint.constant, CGFloat(4.0))
    }

    func test_view1_equal_constant_multiply_view2_subtract_constant() {
        let constraint = (view1[.Width] == 0.5 * view2[.Width] - 4.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(0.5))
        XCTAssertEqual(constraint.constant, CGFloat(-4.0))
    }

    func test_view1_equal_view2_multiply_constant_subtract_constant() {
        let constraint = (view1[.Width] == view2[.Width] * 0.5 - 4.0)
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view2.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, CGFloat(0.5))
        XCTAssertEqual(constraint.constant, CGFloat(-4.0))
    }

    func test_ratio() {
        let constraint = (8.0 * view1[.Width] == 16.0 * view1[.Height])
        XCTAssertTrue(view1.isEqual(constraint.firstItem))
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertTrue(view1.isEqual(constraint.secondItem))
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Height)
        XCTAssertEqual(constraint.multiplier, CGFloat(16.0 / 8.0))
        XCTAssertEqual(constraint.constant, CGFloat(0.0))
    }

    func test_default_priority() {
        let constraint = (view1[.Width] == view2[.Width])
        XCTAssertEqual((view1[.Width] == view2[.Width]).priority,  UILayoutPriority(1000.0))
    }

    func test_priority_operator() {
        let constraint = (view1[.Width] == view2[.Width]) ~ 750.0
        XCTAssertEqual(constraint.priority,  UILayoutPriority(750.0))
    }

    func test_numeric_type_CGFloat() {
        var constraint: NSLayoutConstraint
        constraint = (view1[.Width] == CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (CGFloat(123.0) == view1[.Width])
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (view1[.Width] == CGFloat(123.0) * view2[.Width] + CGFloat(456.0))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(456.0))
        constraint = (view1[.Width] == CGFloat(123.0) * view2[.Width] - CGFloat(456.0))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(-456.0))
    }

    func test_numeric_type_Int() {
        var constraint: NSLayoutConstraint
        constraint = (view1[.Width] == Int(123))
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (Int(123) == view1[.Width])
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (view1[.Width] == Int(123) * view2[.Width] + Int(456))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(456.0))
        constraint = (view1[.Width] == Int(123) * view2[.Width] - Int(456))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(-456.0))
    }

    func test_numeric_type_UInt() {
        var constraint: NSLayoutConstraint
        constraint = (view1[.Width] == UInt(123))
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (UInt(123) == view1[.Width])
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (view1[.Width] == UInt(123) * view2[.Width] + UInt(456))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(456.0))
        constraint = (view1[.Width] == UInt(123) * view2[.Width] - UInt(456))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(-456.0))
    }

    func test_numeric_type_Float() {
        var constraint: NSLayoutConstraint
        constraint = (view1[.Width] == Float(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (Float(123.0) == view1[.Width])
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (view1[.Width] == Float(123.0) * view2[.Width] + Float(456.0))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(456.0))
        constraint = (view1[.Width] == Float(123.0) * view2[.Width] - Float(456.0))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(-456.0))
    }

    func test_numeric_type_Double() {
        var constraint: NSLayoutConstraint
        constraint = (view1[.Width] == Double(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (Double(123.0) == view1[.Width])
        XCTAssertEqual(constraint.constant, CGFloat(123.0))
        constraint = (view1[.Width] == Double(123.0) * view2[.Width] + Double(456.0))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(456.0))
        constraint = (view1[.Width] == Double(123.0) * view2[.Width] - Double(456.0))
        XCTAssertEqual(constraint.multiplier, CGFloat(123.0))
        XCTAssertEqual(constraint.constant, CGFloat(-456.0))
    }
}
