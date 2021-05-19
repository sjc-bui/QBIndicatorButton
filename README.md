# QBIndicatorButton

[![Version](https://img.shields.io/cocoapods/v/QBIndicatorButton.svg?style=flat)](https://cocoapods.org/pods/QBIndicatorButton)
[![License](https://img.shields.io/cocoapods/l/QBIndicatorButton.svg?style=flat)](https://cocoapods.org/pods/QBIndicatorButton)
[![Platform](https://img.shields.io/cocoapods/p/QBIndicatorButton.svg?style=flat)](https://cocoapods.org/pods/QBIndicatorButton)

Custom of UIButton in Swift.
Example |
------------ |
![Screen shot](https://github.com/sjc-bui/QBIndicatorButton/blob/master/Example/Screenshots/QBIndicatorButton.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Features
- Edit button style from storyboard or code
- Set a gradient background and gradient directions
- Customize the corner radius, border color, border width
- Customize the button animation: scale, scale duration
- Edit the button shadows: color, opacity, offset, radius
- Show, hide activity indicator inside the button

## Requirements
- Swift 5.0
- iOS 12.0+

## Getting started

### Storyboard Setup
Add UIButton to Storyboard and set custom class, module.

![Screen shot](https://github.com/sjc-bui/QBIndicatorButton/blob/master/Example/Screenshots/QBIndicatorButton-class.png)

### Code Setup
```swift
var loadingButton: QBIndicatorButton!
loadingButton = QBIndicatorButton(text: "Tap me",
                              textColor: UIColor.white,
                              font: UIFont.systemFont(ofSize: 18, weight: .semibold),
                              backgroundColor: .systemBlue,
                              cornerRadius: 4.0)
```

Show loading indicator.
```swift
loadingButton.start()
// or
loadingButton.start {
    // do something when start
    print("starting...")
}
```

Hide loading indicator.
```swift
loadingButton.stop()
// or
loadingButton.stop {
    // do something when stop
    print("stopping...")
}
```

## Appearance
Supported appearance properties are:

| Property | Type | Description |
| --- | --- | --- |
| `animatedScale` | `CGFloat` | Animated scale |
| `animatedScaleDuration` | `Double` | Animated scale duration |
| `borderColor` | `UIColor` | Border color |
| `borderWidth` | `CGFloat` | Border width |
| `cornerRadius` | `CGFloat` | Corner radius |
| `shadowColor` | `UIColor` | The color of the layer's shadow |
| `shadowOffset` | `CGSize` | The offset of the layer's shadow |
| `shadowOpacity` | `Float` | The opacity of the layer's shadow |
| `shadowRadius` | `CGFloat` | The blur radius of the layer's shadow |
| `gradientEnabled` | `Bool` | Enable gradient background color |
| `gradientStartColor` | `UIColor` | Start of color gradient |
| `gradientEndColor` | `UIColor` | End of color gradient |
| `gradientDirection` | `Int` | Direction of color gradient `0~7` |
| `activityIndicatorPosition` | `Int` | Position of activity indicator `0~2` |

Predefined positions of activity indicator.
```swift
public enum IndicatorPosition: Int {
    case left   = 0
    case center = 1
    case right  = 2
}
```

Predefined directions for color gradient.
```swift
public enum GradientDirection: Int {
    case toTop         = 0
    case toRight       = 1
    case toBottom      = 2
    case toLeft        = 3
    case toTopRight    = 4
    case toTopLeft     = 5
    case toBottomRight = 6
    case toBottomLeft  = 7
}
```

## Installation

QBIndicatorButton is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QBIndicatorButton'
```

## Contributing

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **need help**, open an issue.
- If you **want to contribute**, submit a pull request.

## MIT License

QBIndicatorButton is available under the MIT license. See the LICENSE file for more info.

Made with :heart: by [sjc-bui](https://github.com/sjc-bui).
