# QBIndicatorButton

[![Build Status](https://www.travis-ci.com/sjc-bui/QBIndicatorButton.svg?branch=master)](https://www.travis-ci.com/sjc-bui/QBIndicatorButton)
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
Drag and drop `UIButton` into your Storyboard and set its class and module to `QBIndicatorButton`.

<img src="https://github.com/sjc-bui/QBIndicatorButton/blob/master/Example/Screenshots/QBIndicatorButton-class.png" max-width="50%" height="auto">

Customize your button by setting properties from the Interface Builder.

<img src="https://github.com/sjc-bui/QBIndicatorButton/blob/master/Example/Screenshots/QBIndicatorButton-properties.png" max-width="50%" height="auto">

### Code Setup
```swift
var loadingButton: QBIndicatorButton!
loadingButton = QBIndicatorButton(text: "Tap me",
                              textColor: UIColor.white,
                              font: UIFont.systemFont(ofSize: 18, weight: .semibold),
                              backgroundColor: .systemBlue,
                              cornerRadius: 4.0)
```
Button touch closure.
```swift
loadingButton.touch({ btn in
    // do stuff here
    btn.start()
}, for: .touchUpInside)
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

| Property | Type | Description | Default value |
| --- | --- | --- | --- |
| `animatedScale` | `CGFloat` | Animated scale | `1.0` |
| `animatedScaleDuration` | `Double` | Animated scale duration | `0.2` |
| `borderColor` | `UIColor` | Border color | `UIColor.clear` |
| `borderWidth` | `CGFloat` | Border width | `0.0` |
| `cornerRadius` | `CGFloat` | Corner radius | `4.0` |
| `shadowColor` | `UIColor` | The color of the layer's shadow | `UIColor.clear` |
| `shadowOffset` | `CGSize` | The offset of the layer's shadow | `.zero` |
| `shadowOpacity` | `Float` | The opacity of the layer's shadow | `0.0` |
| `shadowRadius` | `CGFloat` | The blur radius of the layer's shadow | `0.0` |
| `gradientEnabled` | `Bool` | Enable gradient background color | `false` |
| `gradientStartColor` | `UIColor` | Start of color gradient | `UIColor.clear` |
| `gradientEndColor` | `UIColor` | End of color gradient | `UIColor.clear` |
| `gradientDirection` | `Int` | Direction of color gradient `0~7` | `1` |
| `activityIndicatorPosition` | `Int` | Position of activity indicator `0~2` | `1` |
| `titleFadeDuration` | `Double` | Button title fade animated duration | `0.3` |

`QBIndicatorButton` also supported round every single corner of the button.
```swift
// round topLeft and topRight corner only
loadingButton.roundCorners(corners: [.topLeft, .topRight], radius: 20)
// or
// round all corner
loadingButton.roundCorners(corners: [.allCorners], radius: 20)
```

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
