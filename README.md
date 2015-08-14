# FormulaStyleConstraint [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/fhisa/FormulaStyleConstraint/master/LICENSE)

FormulaStyleConstraint is a formula-style layout constraints framework for iOS and Swift.
Using this framework, it is possible to describe auto-layout constraint definitions as simple equations in a Swift program for iOS.

## Code Examples

A constraint that "the width of the view A is equal to minus 4.0 to 50% of the width of the Views B":
```swift
NSLayoutConstraint(
    item: viewA, attribute: .Width,
    relatedBy: .Equal,
    toItem: viewB, attribute: .Width,
    multiplier: 0.5, constant: -4.0)
```
Using FormulaStyleConstraint, it looks like this:
```swift
viewA[.Width] == 0.5 * viewB[.Width] - 4.0
```

A constraint that "the aspect ratio of the view A is 3:4":
```swift
NSLayoutConstraint(
    item: viewA, attribute: .Width,
    relatedBy: .Equal,
    toItem: viewA, attribute: .Height,
    multiplier: 4.0/3.0, constant: 0.0)
```
Using FormulaStyleConstraint, it looks like this:
```swift
viewA[.Width] * 3.0 == viewA[.Height] * 4.0
```
*(Note: Unfortunately, ":" expression ratio using does not currently support now)*

## Reference

Documents is not yet written. Please refer to the code for the [sample application](https://github.com/fhisa/FormulaStyleConstraint/blob/master/SampleApp/ViewController.swift) and [test case](https://github.com/fhisa/FormulaStyleConstraint/blob/master/FormulaStyleConstraintTests/FormulaStyleConstraintTests.swift).
