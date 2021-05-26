import XCTest
@testable import QBIndicatorButton

class Tests: XCTestCase {
    var btn: QBIndicatorButton!

    override func setUp() {
        super.setUp()
        btn = QBIndicatorButton(frame: .zero)
    }

    override func tearDown() {
        btn = nil
        super.tearDown()
    }

    func testButtonProperties() {
        btn = QBIndicatorButton(text: "test",
                                    textColor: .white,
                                    font: UIFont.systemFont(ofSize: 18),
                                    backgroundColor: .green,
                                    cornerRadius: 6.0)
        XCTAssertEqual(btn.titleLabel?.text, "test")
        XCTAssertEqual(btn.titleLabel?.textColor, .white)
        XCTAssertEqual(btn.titleLabel?.font, .systemFont(ofSize: 18))
        XCTAssertEqual(btn.backgroundColor, .green)
        XCTAssertEqual(btn.layer.cornerRadius, 6.0)
    }

    func testGradientBackground() {
        btn = QBIndicatorButton(text: "test2")
        btn.gradientEnabled = true
        btn.gradientStartColor = .red
        btn.gradientEndColor = .blue
        btn.gradientDirection = 1
        XCTAssertEqual(btn.titleLabel?.text, "test2")
        XCTAssertEqual(btn.titleLabel?.textColor, .white)
        XCTAssertEqual(btn.backgroundColor, .black)
        XCTAssertEqual(btn.layer.cornerRadius, 4.0)
        XCTAssertTrue(btn.gradientEnabled)
        XCTAssertEqual(btn.gradientStartColor, UIColor.red)
        XCTAssertEqual(btn.gradientEndColor, UIColor.blue)
        XCTAssertEqual(btn.gradientDirection, 1)
    }

    func testButtonShadow() {
        btn.shadowColor = .gray
        btn.shadowOffset = CGSize(width: 0.5, height: 0.5)
        btn.shadowOpacity = 0.7
        btn.shadowRadius = 10
        XCTAssertTrue(btn.shadowColor == UIColor.gray)
        XCTAssertTrue(btn.shadowOffset == CGSize(width: 0.5, height: 0.5))
        XCTAssertTrue(btn.shadowOpacity == 0.7)
        XCTAssertTrue(btn.shadowRadius == 10)
    }

    func testIndicatorPosition() {
        btn = QBIndicatorButton(text: "test3", textColor: .red)
        btn.activityIndicatorPosition = 1
        XCTAssertEqual(btn.titleLabel?.text, "test3")
        XCTAssertEqual(btn.titleLabel?.textColor, .red)
        XCTAssertEqual(btn.activityIndicatorPosition, 1)
    }

    func testTitleFade() {
        btn.titleFadeDuration = 0.5
        XCTAssertEqual(btn.titleFadeDuration, 0.5)
    }

    func testIndicatorStartAnimating() {
        btn.indicatorStrokeColor = .red
        btn.indicatorStrokeWidth = 2
        btn.indicatorRotateDuration = 2
        XCTAssertTrue(btn.indicator.isHidden)
        btn.indicator.isAnimating = true
        XCTAssertFalse(btn.indicator.isHidden)
        XCTAssertEqual(btn.indicatorStrokeColor, .red)
        XCTAssertEqual(btn.indicatorStrokeWidth, 2)
        XCTAssertEqual(btn.indicatorRotateDuration, 2)
    }

    func testIndicatorStopAnimating() {
        btn.indicator.isAnimating = true
        btn.indicator.isAnimating = false
        XCTAssertTrue(btn.indicator.isHidden)
    }

    func testStartLoading() {
        btn.start()
        XCTAssertTrue(btn.isLoading)
    }

    func testStopLoading() {
        btn.stop()
        XCTAssertFalse(btn.isLoading)
    }
}
