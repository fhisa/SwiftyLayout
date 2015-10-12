//
//  TestHelper.swift
//  SwiftyLayoutTests
//
//  Created by fhisa on 2015/09/09.
//  Copyright © 2015 Hisakuni Fujimoto. All rights reserved.
//

#if os(iOS)

    import UIKit
    typealias View = UIView
    typealias ViewController = UIViewController
    typealias LayoutPriority = UILayoutPriority

    #else

    import AppKit
    typealias View = NSView
    typealias ViewController = NSViewController
    typealias LayoutPriority = NSLayoutPriority

#endif
