import MixboxInAppServices
import Cuckoo
import MixboxUiKit
import XCTest
import MixboxFoundation

// This test requires Accessibility to be enabled.
final class PredefinedObjcMethodsTests: TestCase {
    private let factory = MockAllMethodsWithUniqueImplementationAccessibilityLabelSwizzlerFactory()
    private let methodType: MethodType = .instanceMethod
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        factory
            .getStubbingProxy()
            .allMethodsWithUniqueImplementationAccessibilityLabelSwizzler(
                enhancedAccessibilityLabelMethodSwizzler: any(),
                objcMethodsWithUniqueImplementationProvider: any(),
                baseClass: any(),
                selector: any(),
                methodType: any()
            )
            .thenReturn(
                // Value doesn't matter
                AllMethodsWithUniqueImplementationAccessibilityLabelSwizzler(
                    enhancedAccessibilityLabelMethodSwizzler: MockEnhancedAccessibilityLabelMethodSwizzler(),
                    objcMethodsWithUniqueImplementationProvider: MockObjcMethodsWithUniqueImplementationProvider(),
                    baseClass: NSObject.self,
                    selector: #selector(NSObject.init),
                    methodType: .instanceMethod
                )
            )
    }
    
    func test() {
        let accessibilityLabelSwizzlerFactory = AccessibilityLabelSwizzlerFactoryImpl(
            allMethodsWithUniqueImplementationAccessibilityLabelSwizzlerFactory: factory,
            iosVersionProvider: testCaseUtils.baseUiTestCaseUtils.iosVersionProvider
        )
        
        assertDoesntThrow {
            _ = try accessibilityLabelSwizzlerFactory.accessibilityLabelSwizzler()
            
            let iosVersion = testCaseUtils.baseUiTestCaseUtils.iosVersionProvider.iosVersion().majorVersion
            switch iosVersion {
            case 9, 10:
                checkForIosFrom9To10()
            case 11, 12, 13:
                checkForIosFrom11To13()
            default:
                XCTFail("Current iOS version is not supported in this test: \(iosVersion). Please test it carefully.")
            }
        }
    }
    
    private func checkForIosFrom9To10() {
        verify(factory).allMethodsWithUniqueImplementationAccessibilityLabelSwizzler(
            enhancedAccessibilityLabelMethodSwizzler: isInstance(of: EnhancedAccessibilityLabelMethodSwizzlerImpl.self),
            objcMethodsWithUniqueImplementationProvider: isInstance(of: ObjcRuntimeObjcMethodsWithUniqueImplementationProvider.self),
            baseClass: equal(to: NSObject.self, equalWhen: ===),
            selector: equal(to: #selector(NSObject.accessibilityLabel)),
            methodType: equal(to: methodType)
        )
    }
    
    private func checkForIosFrom11To13() {
        let baseClass = NSObject.self
        let selector = Selector(("_accessibilityAXAttributedLabel"))
        
        verify(factory).allMethodsWithUniqueImplementationAccessibilityLabelSwizzler(
            enhancedAccessibilityLabelMethodSwizzler: isInstance(of: EnhancedAccessibilityLabelMethodSwizzlerImpl.self),
            objcMethodsWithUniqueImplementationProvider: isInstance(of: PredefinedObjcMethodsWithUniqueImplementationProvider.self),
            baseClass: equal(to: baseClass, equalWhen: ===),
            selector: equal(to: selector),
            methodType: equal(to: methodType)
        )
        
        checkObjcMethodsMethodsWithUniqueImplementationArePredefined(
            baseClass: baseClass,
            selector: selector
        )
    }
    
    private func checkObjcMethodsMethodsWithUniqueImplementationArePredefined(
        baseClass: NSObject.Type,
        selector: Selector)
    {
        // Given
        var fallbackWasUsed = false
        
        let fallbackObjcMethodsWithUniqueImplementationProvider = MockObjcMethodsWithUniqueImplementationProvider()
        fallbackObjcMethodsWithUniqueImplementationProvider
            .getStubbingProxy()
            .objcMethodsWithUniqueImplementation(baseClass: any(), selector: any(), methodType: any())
            .then { _ in
                fallbackWasUsed = true
                return []
            }
        
        let stubbedProvider = PredefinedObjcMethodsWithUniqueImplementationProvider(
            fallbackObjcMethodsWithUniqueImplementationProvider: fallbackObjcMethodsWithUniqueImplementationProvider,
            predefinedObjcMethodsWithUniqueImplementationBatchesFactory: PredefinedObjcMethodsWithUniqueImplementationBatchesFactoryImpl(),
            iosVersionProvider: testCaseUtils.baseUiTestCaseUtils.iosVersionProvider
        )
        let realProvider = ObjcRuntimeObjcMethodsWithUniqueImplementationProvider()
        
        let expectedMethods = realProvider
            .objcMethodsWithUniqueImplementation(
                baseClass: baseClass,
                selector: selector,
                methodType: methodType
            )
            .sorted()
        
        // When
        let actualMethods = stubbedProvider
            .objcMethodsWithUniqueImplementation(
                baseClass: baseClass,
                selector: selector,
                methodType: methodType
            )
            .sorted()
        
        // Then
        if actualMethods != expectedMethods || fallbackWasUsed {
            failTest(
                actualMethods: actualMethods,
                expectedMethods: expectedMethods,
                fallbackWasUsed: fallbackWasUsed
            )
        }
    }
    
    private func failTest(
        actualMethods: [ObjcMethodWithUniqueImplementation],
        expectedMethods: [ObjcMethodWithUniqueImplementation],
        fallbackWasUsed: Bool)
    {
        XCTFail(
            """
            Expected methods:
            \(reviewableDescription(expectedMethods))
            Actual methods:
            \(reviewableDescription(actualMethods))\(fallbackWasUsed ? fallbackWasUsedMessageInfix() : "")
            You may want to copy-paste this into `\(PredefinedObjcMethodsWithUniqueImplementationBatchesFactoryImpl.self)`:
            \(copypastableDescription(expectedMethods))`
            """
        )
    }
    
    private func fallbackWasUsedMessageInfix() -> String {
        return """
        
        Note: `fallbackObjcMethodsWithUniqueImplementationProvider` was used by \
        `\(PredefinedObjcMethodsWithUniqueImplementationProvider.self)`, which is not expected for \
        the current iOS version. For the current iOS version it is possible to pre-define all necessary Obj-C methods,
        because they all are a part of iOS and fallback dumps every method of every class and is very expensive \
        (about 1..3 seconds on MacBook Pro 2017).
        """
    }
    
    private func reviewableDescription(_ methods: [ObjcMethodWithUniqueImplementation]) -> String {
        let joined = methods
            .map { (method: ObjcMethodWithUniqueImplementation) -> String in
                method.debugDescription
            }
            .joined(separator: ",\n")
        
        return String(joined)
            .mb_wrapAndIndent(prefix: "[", postfix: "]", indentation: "    ", ifEmpty: "[]")
    }
    
    private func copypastableDescription(_ methods: [ObjcMethodWithUniqueImplementation]) -> String {
        let joined = methods
            .map { (method: ObjcMethodWithUniqueImplementation) -> String in
                """
                method(class: "\(method.class)")
                """
            }
            .joined(separator: ",\n")
        
        return String(joined)
            .mb_wrapAndIndent(prefix: "[", postfix: "]", indentation: "    ", ifEmpty: "[]")
    }
}
