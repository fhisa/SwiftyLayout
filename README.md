# FormulaStyleConstraint

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/fhisa/FormulaStyleConstraint/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub release](https://img.shields.io/github/release/fhisa/FormulaStyleConstraint.svg)](https://github.com/fhisa/FormulaStyleConstraint/releases)
[![build passing](https://travis-ci.org/fhisa/FormulaStyleConstraint.png?branch=master)](https://travis-ci.org/fhisa/FormulaStyleConstraint)

[![Join the chat at https://gitter.im/fhisa/FormulaStyleConstraint](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/fhisa/FormulaStyleConstraint?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

FormulaStyleConstraint is a framework that allows to describe layout constraints (ie NSLayoutConstraint) as a simple mathematical formula in a Swift program.

## Code Examples

### Basic usage

Using the framework, a layout constraint that "the width of the view A is equal to minus 4.0 to 50% of the width of the Views B" follows:
```swift
viewA[.Width] == 0.5 * viewB[.Width] - 4.0
```
This is the same layout constraints with the following code:
```swift
NSLayoutConstraint(
    item: viewA, attribute: .Width,
    relatedBy: .Equal,
    toItem: viewB, attribute: .Width,
    multiplier: 0.5, constant: -4.0)
```

### e.g. Aspect ratio

A layout constraint that "the aspect ratio of the view A is 3:4" follows:
```swift
viewA[.Width] * 3.0 == viewA[.Height] * 4.0
```
This is the same layout constraints with the following code:
```swift
NSLayoutConstraint(
    item: viewA, attribute: .Width,
    relatedBy: .Equal,
    toItem: viewA, attribute: .Height,
    multiplier: 4.0/3.0, constant: 0.0)
```

### e.g. Specify the priority

The framework has priority specification operator `~` like the following.
```swift
innerView[.Leading] == outerView[.Leading] + 4.0 ~ 750.0
```
This is the same layout constraints with the following code:
```swift
var constraint = NSLayoutConstraint(
    item: innerView, attribute: .Leading,
    relatedBy: .Equal,
    toItem: outerView, attribute: .Leading,
    multiplier: 1.0, constant: 4.0)
constraint.priority = 750.0
// -> constraint
```

Please refer to the code for the [sample application](https://github.com/fhisa/FormulaStyleConstraint/blob/master/SampleApp/ViewController.swift) and [test case](https://github.com/fhisa/FormulaStyleConstraint/blob/master/FormulaStyleConstraintTests/FormulaStyleConstraintTests.swift), too.

## Refrence Guide

### ConstraintTerm

ConstraintTerm means a term that contains a view in the right side or the left side of a layout constraint.
For example, a ConstraintTerm representing the width `.Width` of view `viewA`:
```swift
viewA[.Width]
```
`viewA` is a UIView instance object, `.Width` is a `NSLayoutAttribute` value.
ConstraintTerm is defined as a structure such as the following:
```swift
public struct ConstraintTerm
{
    let view: UIView?
    let attribute: NSLayoutAttribute
    var multiplier: CGFloat = 1.0
    var constant: CGFloat = 0.0
}
```

### Operators

*The following table, CONSTANT means CGFloat value*

| operator | lhs | rhs | value | semantics |
|:-----:|:---------------|:---------------|:---------------|:--|
| +     | ConstraintTerm | CONSTANT       | ConstraintTerm | add rhs value to lhs.constant |
| +     | CONSTANT       | ConstraintTerm | ConstraintTerm | add lhs value to rhs.constant |
| -     | ConstraintTerm | CONSTANT       | ConstraintTerm | subtract rhs value from lhs.constant |
| *     | ConstraintTerm | CONSTANT       | ConstraintTerm | multiply rhs value to lhs.multiplier and lhs.constant |
| *     | CONSTANT       | ConstraintTerm | ConstraintTerm | multiply lhs value to rhs.multiplier and rhs.constant |
| ==    | ConstraintTerm | ConstraintTerm | NSLayoutConstraint | create a layout constraint that "lhs is equal to lhs" |
| ==    | ConstraintTerm | CONSTANT       | NSLayoutConstraint | ditto |
| ==    | CONSTANT       | ConstraintTerm | NSLayoutConstraint | ditto |
| <=    | ConstraintTerm | ConstraintTerm | NSLayoutConstraint | create a layout constraint that "lhs is less than or equal to lhs" |
| <=    | ConstraintTerm | CONSTANT       | NSLayoutConstraint | ditto |
| <=    | CONSTANT       | ConstraintTerm | NSLayoutConstraint | ditto |
| >=    | ConstraintTerm | ConstraintTerm | NSLayoutConstraint | create a layout constraint that "lhs is greater than or equal to lhs" |
| >=    | ConstraintTerm | CONSTANT       | NSLayoutConstraint | ditto |
| >=    | CONSTANT       | ConstraintTerm | NSLayoutConstraint | ditto |
| ~     | NSLayoutConstraint | CONSTANT(Float) | NSLayoutConstraint | Change the priority of a layout constraint, and return the constraint |

## Requirements

- Swift 2.0 (Xcode 7 or later)
- iOS 8 or later (by Carthage) / iOS 7 (by coping the source files directly)

## Installation

There are two options.

### Using Carthage (iOS 8 or later)

Using [Carthage](https://github.com/Carthage/Carthage), it's easy to add FormulaStyleConstraint to the project.

- Add `github "fhisa/FormulaStyleConstraint"` to your Cartfile.
- Run `carthage update`
- Add FormulaStyleConstraint.framework in Carthage/Build/iOS to your Xcode project.

### Copying source files directly (iOS 7)

- Add this repository as a git submodule:
```shell
$ git submodule add https://github.com/fhisa/FormulaStyleConstraint.git PATH_TO_SUBMODULE
// or
$ carthage update --use-submodules
```
- Then just add references of FormulaStyleConstraint/*.swift to your Xcode project.

## TODO

- [CocoaPods](https://cocoapods.org) support

## license

FormulaStyleConstraint is released under the [MIT license](https://github.com/fhisa/FormulaStyleConstraint/blob/master/LICENSE).
