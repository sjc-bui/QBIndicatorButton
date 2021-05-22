import XCTest
import QBIndicatorButton

class Tests: XCTestCase {
    var btn = QBIndicatorButton()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

    func testStartLoading() {
        btn.start()
        XCTAssertTrue(btn.isLoading)
        XCTAssertNotNil(btn.activityIndicator)
    }

    func testStopLoading() {
        btn.stop()
        XCTAssertFalse(btn.isLoading)
        XCTAssertNil(btn.activityIndicator)
    }
}
