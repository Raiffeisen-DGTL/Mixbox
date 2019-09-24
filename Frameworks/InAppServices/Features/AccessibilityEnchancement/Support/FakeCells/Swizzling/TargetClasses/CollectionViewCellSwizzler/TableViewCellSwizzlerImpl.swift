//
//  TableViewCellSwizzlerImpl.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxTestability
import MixboxFoundation

public final class TableViewCellSwizzlerImpl: TableViewCellSwizzler {
    private let assertingSwizzler: AssertingSwizzler
    private let shouldAddAssertionForCallingIsHiddenOnFakeCell: Bool
    private let onceToken = ThreadUnsafeOnceToken()

    public init(
        assertingSwizzler: AssertingSwizzler,
        // The assert is important, but it adds some side-effects that may break some tests,
        // in that case you can disable it and use it only in tests on this feature
        shouldAddAssertionForCallingIsHiddenOnFakeCell: Bool)
    {
        self.assertingSwizzler = assertingSwizzler
        self.shouldAddAssertionForCallingIsHiddenOnFakeCell = shouldAddAssertionForCallingIsHiddenOnFakeCell
    }

    public func swizzle() {
        onceToken.executeOnce {
            swizzleWhileBeingExecutedOnce()
        }
    }

    private func swizzleWhileBeingExecutedOnce() {
        swizzle(
            originalSelector: #selector(UIView.accessibilityElementCount),
            swizzledSelector: #selector(UITableViewCell.swizzled_TableViewCellSwizzler_accessibilityElementCount),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: false
        )

        swizzle(
            originalSelector: #selector(UIView.accessibilityElement(at:)),
            swizzledSelector: #selector(UITableViewCell.swizzled_TableViewCellSwizzler_accessibilityElement(at:)),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: false
        )

        swizzle(
            originalSelector: #selector(getter: UIView.isHidden),
            swizzledSelector: shouldAddAssertionForCallingIsHiddenOnFakeCell
                ? #selector(UITableViewCell.swizzled_TableViewCellSwizzler_isHidden_withAssertion)
                : #selector(UITableViewCell.swizzled_TableViewCellSwizzler_isHidden),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: true
        )
    }

    private func swizzle(
        originalSelector: Selector,
        swizzledSelector: Selector,
        shouldAssertIfMethodIsSwizzledOnlyOneTime: Bool)
    {
        assertingSwizzler.swizzle(
            class: UITableViewCell.self,
            originalSelector: originalSelector,
            swizzledSelector: swizzledSelector,
            methodType: .instanceMethod,
            shouldAssertIfMethodIsSwizzledOnlyOneTime: shouldAssertIfMethodIsSwizzledOnlyOneTime
        )
    }
}

// Note that we use extension of UIView instead of extension of UICollectionViewCell.
// See comment for same extension in CollectionViewSwizzler for more info.
//
// Specific notes for this code:
// We only modify behavior of fake cells. We don't want to mess with real cells.
extension UIView {
    @objc fileprivate func swizzled_TableViewCellSwizzler_accessibilityElementCount() -> Int {
        guard let tableViewCell = self as? UITableViewCell else {
            return swizzled_TableViewCellSwizzler_accessibilityElementCount()
        }

        if tableViewCell.mb_isFakeCell() {
            return tableViewCell.subviews.count
        } else {
            return swizzled_TableViewCellSwizzler_accessibilityElementCount()
        }
    }

    @objc fileprivate func swizzled_TableViewCellSwizzler_accessibilityElement(at index: Int) -> Any? {
        guard let tableViewCell = self as? UITableViewCell else {
            return swizzled_TableViewCellSwizzler_accessibilityElement(at: index)
        }

        if tableViewCell.mb_isFakeCell() {
            return tableViewCell.subviews[index]
        } else {
            return swizzled_TableViewCellSwizzler_accessibilityElement(at: index)
        }
    }

    @objc fileprivate func swizzled_TableViewCellSwizzler_isHidden_withAssertion() -> Bool {
        return isHidden(
            originalImplementation: swizzled_TableViewCellSwizzler_isHidden_withAssertion,
            withAssertion: false
        )
    }

    @objc fileprivate func swizzled_TableViewCellSwizzler_isHidden() -> Bool {
        return isHidden(
            originalImplementation: swizzled_TableViewCellSwizzler_isHidden,
            withAssertion: false
        )
    }

    @nonobjc private func isHidden(
        originalImplementation: () -> Bool,
        withAssertion: Bool)
        -> Bool
    {
        guard let tableViewCell = self as? UITableViewCell else {
            return originalImplementation()
        }

        if tableViewCell.mb_isFakeCell() {
            if withAssertion {
                assertionFailure("isHidden should never be called for a fake cell")
            }

            // We are relatively safe to alter isHidden if the cell is not in hierarchy,
            // E.g. isHidden can be used on fake cells when they are being set up.
            if tableViewCell.superview == nil {
                // It is usually `true` for real cells and can be `false` for fake cells,
                // if they were obtained from a reuse pool with _isHiddenForReuse == true.
                return true
            }
        }

        return originalImplementation()
    }
}

#endif

