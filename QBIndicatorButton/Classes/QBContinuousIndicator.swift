//
//  QBContinuousIndicator.swift
//  QBIndicatorButton
//
//  Created by quan bui on 2021/05/26.
//

import UIKit

public typealias CfTime = CFTimeInterval

extension UIView {
    func rotate360(duration: CfTime) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = .infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

class QBContinuousIndicator: UIView {

    public var strokeWidth: CGFloat     = 1.0
    public var rotateDuration: CfTime   = 1.0
    public var foregroundColor: UIColor = .white

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }

    public var isAnimating: Bool = false {
        didSet {
            if isAnimating {
                self.rotate360(duration: rotateDuration)
            } else {
                self.layer.removeAllAnimations()
            }
            self.isHidden = !isAnimating
        }
    }

    private func setUp() {
        self.isHidden = true
        self.backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        let width = bounds.width
        let height = bounds.height
        let radius = (min(width, height) - strokeWidth) / 2

        var currentPoint = CGPoint(x: width / 2 + radius, y: height / 2)
        var priorAngle = CGFloat(360)

        for angle in stride(from: CGFloat(360), through: 0, by: -2) {
            let path = UIBezierPath()
            path.lineWidth = strokeWidth

            path.move(to: currentPoint)
            currentPoint = CGPoint(x: width  / 2 + cos(angle * .pi / 180) * radius,
                                   y: height / 2 + sin(angle * .pi / 180) * radius)
            path.addArc(withCenter: CGPoint(x: width  / 2,
                                            y: height / 2),
                        radius: radius,
                        startAngle: priorAngle * .pi / 180,
                        endAngle: angle * .pi / 180,
                        clockwise: false)
            priorAngle = angle
            foregroundColor.withAlphaComponent(angle / 360).setStroke()
            path.stroke()
        }
    }
}
