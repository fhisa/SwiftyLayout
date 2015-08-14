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
        let c = (view1[.Width] == view2[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 1.0)
        XCTAssertEqual(c.constant, 0.0)
    }

    func test_view1_less_than_or_equal_view2() {
        let c = (view1[.Width] <= view2[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 1.0)
        XCTAssertEqual(c.constant, 0.0)
    }

    func test_view1_greater_than_or_equal_view2() {
        let c = (view1[.Width] >= view2[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 1.0)
        XCTAssertEqual(c.constant, 0.0)
    }

    func test_view1_equal_constant() {
        let c = (view1[.Width] == 12345)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertNil(c.secondItem)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(c.constant, 12345)
    }

    func test_view1_less_than_or_equal_constant() {
        let c = (view1[.Width] <= 12345)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(c.secondItem)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(c.constant, 12345)
    }

    func test_view1_greater_than_or_equal_constant() {
        let c = (view1[.Width] >= 12345)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(c.secondItem)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(c.constant, 12345)
    }

    func test_constant_equal_view1() {
        let c = (12345 == view1[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertNil(c.secondItem)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(c.constant, 12345)
    }

    func test_constant_less_than_or_equal_view1() {
        let c = (12345 <= view1[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.GreaterThanOrEqual)
        XCTAssertNil(c.secondItem)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(c.constant, 12345)
    }

    func test_constant_greater_than_or_equal_view1() {
        let c = (12345 >= view1[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.LessThanOrEqual)
        XCTAssertNil(c.secondItem)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.NotAnAttribute)
        XCTAssertEqual(c.constant, 12345)
    }

    func test_view1_equal_constant_multiply_view2() {
        let c = (view1[.Width] == 0.5 * view2[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 0.5)
        XCTAssertEqual(c.constant, 0.0)
    }

    func test_view1_equal_view2_multiply_constant() {
        let c = (view1[.Width] == view2[.Width] * 0.5)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 0.5)
        XCTAssertEqual(c.constant, 0.0)
    }

    func test_view1_equal_view2_add_constant() {
        let c = (view1[.Width] == view2[.Width] + 4.0)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 1.0)
        XCTAssertEqual(c.constant, 4.0)
    }

    func test_view1_equal_constant_add_view2() {
        let c = (view1[.Width] == 4.0 + view2[.Width])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 1.0)
        XCTAssertEqual(c.constant, 4.0)
    }

    func test_view1_equal_constant_multiply_view2_add_constant() {
        let c = (view1[.Width] == 0.5 * view2[.Width] + 4.0)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 0.5)
        XCTAssertEqual(c.constant, 4.0)
    }

    func test_view1_equal_view2_multiply_constant_add_constant() {
        let c = (view1[.Width] == view2[.Width] * 0.5 + 4.0)
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view2)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.multiplier, 0.5)
        XCTAssertEqual(c.constant, 4.0)
    }

    func test_ratio() {
        let c = (8.0 * view1[.Width] == 16.0 * view1[.Height])
        XCTAssertEqual(c.firstItem as! UIView, view1)
        XCTAssertEqual(c.firstAttribute, NSLayoutAttribute.Width)
        XCTAssertEqual(c.relation, NSLayoutRelation.Equal)
        XCTAssertEqual(c.secondItem as! UIView, view1)
        XCTAssertEqual(c.secondAttribute, NSLayoutAttribute.Height)
        XCTAssertEqual(c.multiplier, 16.0 / 8.0)
        XCTAssertEqual(c.constant, 0.0)
    }
}

