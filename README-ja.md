# FormulaStyleConstraint [![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/fhisa/FormulaStyleConstraint/master/LICENSE)

FormulaStyleConstraint は、Swift による iOSプログラミングにおいて、レイアウト制約を簡潔な数式のように記述するためのフレームワークです。

## コード例

「ビューAの横幅はビューBの横幅の50%から4.0引いたものと等しい」という制約:
```swift
NSLayoutConstraint(
    item: viewA, attribute: .Width,
    relatedBy: .Equal,
    toItem: viewB, attribute: .Width,
    multiplier: 0.5, constant: -4.0)
```
は、FormulaStyleConstraint を使うと:
```swift
viewA[.Width] == 0.5 * viewB[.Width] - 4.0
```
のように記述することができます。

また「ビューAのサイズの縦横比は 3:4 に等しい」という制約:
```swift
NSLayoutConstraint(
    item: viewA, attribute: .Width,
    relatedBy: .Equal,
    toItem: viewA, attribute: .Height,
    multiplier: 4.0/3.0, constant: 0.0)
```
は、FormulaStyleConstraint を使うと:
```swift
viewA[.Width] * 3.0 == viewA[.Height] * 4.0
```
のように記述することができます(残念ながら ":" を使った比率の式はまだサポートしていません)。

## リファレンス

まだ書いていません。使い方は、[サンプルアプリ](https://github.com/fhisa/FormulaStyleConstraint/blob/master/SampleApp/ViewController.swift)や[テストケース](https://github.com/fhisa/FormulaStyleConstraint/blob/master/FormulaStyleConstraintTests/FormulaStyleConstraintTests.swift)のコードを参考にしてください。
