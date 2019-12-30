import MixboxUiTestsFoundation
import XCTest

public final class XcuiScreenshotTaker: ScreenshotTaker {
    public init() {
    }
    
    public func takeScreenshot() -> UIImage? {
        return ObjectiveCExceptionCatcher.catch(try: { () -> (UIImage) in
            return XCUIScreen.main.screenshot().image
        }, catch: { (exception) -> (UIImage) in
            return UIImage()
        })
    }
}
