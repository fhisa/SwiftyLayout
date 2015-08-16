# FormulaStyleConstraint [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/fhisa/FormulaStyleConstraint/master/LICENSE) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

FormulaStyleConstraint is a framework to simplify the definition of automatic layout constraints in a Swift program for iOS.
Using this framework, it is possible to define the automatic layout constraints as a simple equation.

(*[Japanese README](https://github.com/fhisa/FormulaStyleConstraint/blob/master/README-ja.md)*)

## Code Examples

### Example 1

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

### Example 2

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

### Binary Operators

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
| ~     | NSLayoutConstraint | CONSTANT(Float) | NSLayoutConstraint | Change priority of a layout constraint, and return the constraint |

## license

MIT license. See the [LICENSE](https://github.com/fhisa/FormulaStyleConstraint/blob/master/LICENSE) file for details.
