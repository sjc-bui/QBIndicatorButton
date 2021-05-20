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
        XCTAssertTrue(btn.titleLabel?.text == "test")
        XCTAssertTrue(btn.titleLabel?.textColor == .white)
        XCTAssertTrue(btn.titleLabel?.font == .systemFont(ofSize: 18))
        XCTAssertTrue(btn.backgroundColor == .green)
        XCTAssertTrue(btn.layer.cornerRadius == 6.0)
    }

    func testGradientBackground() {
        btn = QBIndicatorButton(text: "test2")
        btn.gradientEnabled = true
        btn.gradientStartColor = .red
        btn.gradientEndColor = .blue
        btn.gradientDirection = 1
        XCTAssertTrue(btn.titleLabel?.text == "test2")
        XCTAssertTrue(btn.titleLabel?.textColor == .white)
        XCTAssertTrue(btn.backgroundColor == .black)
        XCTAssertTrue(btn.layer.cornerRadius == 4.0)
        XCTAssertTrue(btn.gradientEnabled == true)
        XCTAssertTrue(btn.gradientStartColor == UIColor.red)
        XCTAssertTrue(btn.gradientEndColor == UIColor.blue)
        XCTAssertTrue(btn.gradientDirection == 1)
    }

    func testIndicatorPosition() {
        btn = QBIndicatorButton(text: "test3", textColor: .red)
        btn.activityIndicatorPosition = 1
        XCTAssertTrue(btn.titleLabel?.text == "test3")
        XCTAssertTrue(btn.titleLabel?.textColor == .red)
        XCTAssertTrue(btn.activityIndicatorPosition == 1)
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
