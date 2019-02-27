import MixboxIpcCommon
import MixboxIpcClients
import MixboxIpc
import MixboxUiKit
import MixboxUiTestsFoundation
import XCTest

extension ElementSnapshot {
    
    public func hasKeyboardFocusOrHasDescendantThatHasKeyboardFocus() -> Bool {
        if hasKeyboardFocus {
            return true
        }
        for child in children {
            if child.hasKeyboardFocusOrHasDescendantThatHasKeyboardFocus() {
                return true
            }
        }
        return false
    }
    
    public func xcuiImage() -> UIImage? {
        // TODO: Remove singletons, use ScreenshotTaker
        let image = XCUIScreen.main.screenshot().image
        
        guard let cgImage = image.cgImage else {
            return nil
        }
        
        // x and y have to be rounded because CGImage.cropping doesn't handle
        let frameForCropping = CGRect(
            x: (frameOnScreen.origin.x * image.scale).rounded(.down),
            y: (frameOnScreen.origin.y * image.scale).rounded(.up),
            width: frameOnScreen.size.width * image.scale,
            height: frameOnScreen.size.height * image.scale
        )
        
        guard let croppedCgImage = cgImage.cropping(to: frameForCropping) else {
            return nil
        }
        
        let croppedImage = UIImage(cgImage: croppedCgImage, scale: image.scale, orientation: image.imageOrientation)
        
        return croppedImage
    }
}
