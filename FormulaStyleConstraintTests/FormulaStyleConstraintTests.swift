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
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 1.0)
        XCTAssertEqual(constraint.constant, 0.0)
    }

    func test_view1_less_than_or_equal_view2() {
        let constraint = (view1[.Width] <= view2[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 1.0)
        XCTAssertEqual(constraint.constant, 0.0)
    }

    func test_view1_greater_than_or_equal_view2() {
        let constraint = (view1[.Width] >= view2[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 1.0)
        XCTAssertEqual(constraint.constant, 0.0)
    }

    func test_view1_equal_constant() {
        let constraint = (view1[.Width] == 12345)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, 12345)
    }

    func test_view1_less_than_or_equal_constant() {
        let constraint = (view1[.Width] <= 12345)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, 12345)
    }

    func test_view1_greater_than_or_equal_constant() {
        let constraint = (view1[.Width] >= 12345)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, 12345)
    }

    func test_constant_equal_view1() {
        let constraint = (12345 == view1[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, 12345)
    }

    func test_constant_less_than_or_equal_view1() {
        let constraint = (12345 <= view1[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, 12345)
    }

    func test_constant_greater_than_or_equal_view1() {
        let constraint = (12345 >= view1[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(constraint.constant, 12345)
    }

    func test_view1_equal_constant_multiply_view2() {
        let constraint = (view1[.Width] == 0.5 * view2[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 0.0)
    }

    func test_view1_equal_view2_multiply_constant() {
        let constraint = (view1[.Width] == view2[.Width] * 0.5)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 0.0)
    }

    func test_view1_equal_view2_add_constant() {
        let constraint = (view1[.Width] == view2[.Width] + 4.0)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 1.0)
        XCTAssertEqual(constraint.constant, 4.0)
    }

    func test_view1_equal_constant_add_view2() {
        let constraint = (view1[.Width] == 4.0 + view2[.Width])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 1.0)
        XCTAssertEqual(constraint.constant, 4.0)
    }

    func test_view1_equal_constant_multiply_view2_add_constant() {
        let constraint = (view1[.Width] == 0.5 * view2[.Width] + 4.0)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 4.0)
    }

    func test_view1_equal_view2_multiply_constant_add_constant() {
        let constraint = (view1[.Width] == view2[.Width] * 0.5 + 4.0)
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view2)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.multiplier, 0.5)
        XCTAssertEqual(constraint.constant, 4.0)
    }

    func test_ratio() {
        let constraint = (8.0 * view1[.Width] == 16.0 * view1[.Height])
        XCTAssertEqual(constraint.firstItem as! UIView, view1)
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(constraint.secondItem as! UIView, view1)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Height)
        XCTAssertEqual(constraint.multiplier, 16.0 / 8.0)
        XCTAssertEqual(constraint.constant, 0.0)
    }
}

