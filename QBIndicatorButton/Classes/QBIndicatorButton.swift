//
//  QBIndicatorButton.swift
//  QBIndicatorButton
//
//  Created by quan bui on 2021/05/19.
//

import UIKit

public typealias ActionCompletionHandler = (() -> Void)?

public typealias ButtonHandler = ((_ button: QBIndicatorButton) -> Void)?

@IBDesignable
open class QBIndicatorButton: UIButton {

    private var activityIndicatorColor: UIColor = .white

    private var direction: GradientDirection = .toRight

    private var indicatorPosition: IndicatorPosition = .center

    public var isLoading: Bool = false

    @IBInspectable open var animatedScale: CGFloat = 1.0

    @IBInspectable open var animatedScaleDuration: Double = 0.2

    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }

    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }

    @IBInspectable open var cornerRadius: CGFloat = 4.0 {
        didSet {
            self.clipsToBounds = (self.cornerRadius > 0)
            self.layer.cornerRadius = self.cornerRadius
            if let gradientLayer = gradient {
                gradientLayer.cornerRadius = cornerRadius
            }
        }
    }

    @IBInspectable open var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }

    @IBInspectable open var shadowOffset: CGSize = .zero {
        didSet {
            self.layer.masksToBounds = !(self.shadowOffset != .zero)
            self.layer.shadowOffset = self.shadowOffset
        }
    }

    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }

    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
        }
    }

    @IBInspectable open var gradientEnabled: Bool = false {
        didSet {
            customGradient()
        }
    }

    @IBInspectable open var gradientStartColor: UIColor = UIColor.clear {
        didSet {
            customGradient()
        }
    }

    @IBInspectable open var gradientEndColor: UIColor = UIColor.clear {
        didSet {
            customGradient()
        }
    }

    @IBInspectable open var gradientDirection: Int {
        get {
            return self.direction.rawValue
        }
        set (index) {
            self.direction = GradientDirection(rawValue: index) ?? .toRight
            customGradient()
        }
    }

    @IBInspectable open var activityIndicatorPosition: Int {
        get {
            return self.indicatorPosition.rawValue
        }
        set (index) {
            self.indicatorPosition = IndicatorPosition(rawValue: index) ?? .center
        }
    }

    @IBInspectable open var titleFadeDuration: Double = 0.3

    var gradient: CAGradientLayer?

    func customGradient() {
        gradient?.removeFromSuperlayer()
        guard gradientEnabled else { return }

        gradient = CAGradientLayer()
        guard let gradient = gradient else { return }

        gradient.frame = self.layer.bounds
        gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
        gradient.locations = [0.0, 1.0]
        let dirPoint = directionPoint(CGSize(width: 1, height: 1))
        gradient.startPoint = dirPoint.start
        gradient.endPoint = dirPoint.end
        gradient.cornerRadius = self.cornerRadius

        self.layer.insertSublayer(gradient, below: self.imageView?.layer)
    }

    private var circle = QBContinuousIndicator()

    override open func layoutSubviews() {
        super.layoutSubviews()
        gradient?.frame = self.layer.bounds
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    /// Initializer
    /// - Parameters:
    ///   - text: title of the button
    ///   - textColor: text color of the button
    ///   - font: font of the button
    ///   - backgroundColor: background color of the button
    ///   - cornerRadius: corner radius of the button
    ///   - indicatorPosition: activity indicator position inside the button
    public init(
        frame: CGRect = .zero,
        text: String? = nil,
        textColor: UIColor? = .white,
        font: UIFont? = nil,
        backgroundColor: UIColor? = .black,
        cornerRadius: CGFloat = 4.0
    ) {
        super.init(frame: frame)
        if let text = text {
            self.setTitle(text)
            self.setTitleColor(textColor, for: .normal)
            self.activityIndicatorColor = textColor!
            self.titleLabel?.adjustsFontSizeToFitWidth = true
        }
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.setCornerBorder(cornerRadius: cornerRadius)
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// Round every corner of the button
    /// - Parameters:
    ///   - corners: topLeft, topRight, bottomRight, bottomLeft
    ///   - radius: custom coner radius - default = 4
    open func roundCorners(corners: UIRectCorner, radius: Int = 4) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }

    fileprivate var action: ((_ button: QBIndicatorButton) -> Void)?

    open func touch(_ action: ButtonHandler = nil, for controlEvents: UIControl.Event) {
        self.action = action
        self.addTarget(self, action: #selector(touchEvent), for: controlEvents)
    }

    @objc private func touchEvent(sender: QBIndicatorButton) {
        self.action?(sender)
    }

    /// Display activity indicator inside the button
    /// - Parameter completion: The completion handler
    open func start(_ completion: ActionCompletionHandler = nil) {
        guard !isLoading else { return }

        self.isUserInteractionEnabled = false
        self.isLoading = true

        UIView.animate(withDuration: animatedScaleDuration) {
            self.transform = CGAffineTransform(scaleX: self.animatedScale, y: self.animatedScale)
        } completion: { _ in
            UIView.animate(withDuration: self.animatedScaleDuration) {
                self.transform = CGAffineTransform.identity
            } completion: { _ in
                UIView.transition(with: self, duration: self.titleFadeDuration, options: .curveEaseOut) {
                    self.alpha = 0.9
                    self.titleLabel?.alpha = self.indicatorPosition == .center ? 0.0 : 0.6
                } completion: { _ in
                    self.showIndicator()
                    completion?()
                }
            }
        }
    }

    /// Hide activity indicator inside the button
    /// - Parameter completion: The completion handler
    open func stop(_ completion: ActionCompletionHandler = nil) {
        guard isLoading else { return }

        self.isUserInteractionEnabled = true
        self.isLoading = false

        UIView.animate(withDuration: 0.2) {
            self.circle.alpha = 0
        } completion: { _ in
            self.circle.isAnimating = false
            self.circle.removeFromSuperview()
        }

        UIView.transition(with: self,
                          duration: self.titleFadeDuration,
                          options: .curveEaseOut) {
            self.alpha = 1.0
            self.titleLabel?.alpha = 1.0
        } completion: { _ in
            completion?()
        }
    }

    private func showIndicator() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(circle)
        positionCircleIndicator()

        circle.alpha = 0
        circle.isAnimating = true
        UIView.animate(withDuration: 0.2) {
            self.circle.alpha = 1
        }
    }

    private func positionCircleIndicator() {
        let frameHeight = self.frame.height
        circle.widthAnchor.constraint(equalToConstant: frameHeight / 2).isActive = true
        circle.heightAnchor.constraint(equalToConstant: frameHeight / 2).isActive = true

        switch indicatorPosition {
        case .left:
            circle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: frameHeight * 0.25).isActive = true
        case .center:
            circle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        case .right:
            circle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -frameHeight * 0.25).isActive = true
        }
        circle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

    private func directionPoint(_ size: CGSize) -> (start: CGPoint, end: CGPoint) {
        switch direction {
        case .toTop:
            return (CGPoint(x: size.width / 2, y: size.height),
                    CGPoint(x: size.width / 2, y: 0.0))
        case .toRight:
            return (CGPoint(x: 0.0, y: size.width / 2),
                    CGPoint(x: size.width, y: size.height / 2))
        case .toBottom:
            return (CGPoint(x: size.width / 2, y: 0.0),
                    CGPoint(x: size.width / 2, y: size.height))
        case .toLeft:
            return (CGPoint(x: size.width, y: size.height / 2),
                    CGPoint(x: 0.0, y: size.height / 2))
        case .toTopRight:
            return (CGPoint(x: 0.0, y: size.height),
                    CGPoint(x: size.width, y: 0.0))
        case .toTopLeft:
            return (CGPoint(x: size.width, y: size.height),
                    CGPoint(x: 0.0, y: 0.0))
        case .toBottomRight:
            return (CGPoint(x: 0.0, y: 0.0),
                    CGPoint(x: size.width, y: size.height))
        case .toBottomLeft:
            return (CGPoint(x: size.width, y: 0.0),
                    CGPoint(x: 0.0, y: size.height))
        }
    }
}
