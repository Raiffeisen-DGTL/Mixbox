//
//  TableViewSizzlerImpl.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES
import Foundation
import MixboxTestability
import MixboxFoundation

// TODO: Split. swiftlint:disable file_length
public final class TableViewSizzlerImpl: TableViewSwizzler {
    private let assertingSwizzler: AssertingSwizzler
    private let onceToken = ThreadUnsafeOnceToken()

    public init(assertingSwizzler: AssertingSwizzler) {
        self.assertingSwizzler = assertingSwizzler
    }

    public func swizzle() {
        onceToken.executeOnce {
            swizzleWhileBeingExecutedOnce()
        }
    }

    private func swizzleWhileBeingExecutedOnce() {
        swizzle(
            originalSelector: #selector(UITableView.reloadData),
            swizzledSelector: #selector(UITableView.swizzled_TableViewSwizzler_reloadData),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: true
        )
        swizzle(
            originalSelector: #selector(UITableView.endUpdates),
            swizzledSelector: #selector(UITableView.swizzled_tableViewSwizzler_endUpdates),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: true
        )
        // UIAccessibilityContainer:
        swizzle(
            originalSelector: #selector(UIView.accessibilityElementCount),
            swizzledSelector: #selector(UIView.swizzled_tableViewSwizzler_accessibilityElementCount),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: false // Also swizzled for UITableVIewCell
        )
        swizzle(
            originalSelector: #selector(UIView.accessibilityElement(at:)),
            swizzledSelector: #selector(UIView.swizzled_TableViewSwizzler_accessibilityElement(at:)),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: false  // Also swizzled for UITableVIewCell
        )
        swizzle(
            originalSelector: #selector(UIView.index(ofAccessibilityElement:)),
            swizzledSelector: #selector(UIView.swizzled_TableViewSwizzler_index(ofAccessibilityElement:)),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: true
        )
        // Without swizzling that function below (with swizzling of functions of UIAccessibilityContainer only),
        // XCUI will somehow somethime strangely mix unnecessary cells into AX hierarchy. I didn't understand
        // how and why it does it. So, the default implementation of _accessibilityUserTestingChildren, which
        // calls UIAccessibilityContainer, returns an array with extra objects. That function is private,
        // the hack below was found after some reverse engineering.
        swizzle(
            originalSelector: Selector(("_accessibilityUserTestingChildren")),
            swizzledSelector: #selector(UIView.swizzled_TableViewSwizzler_accessibilityUserTestingChildren),
            shouldAssertIfMethodIsSwizzledOnlyOneTime: true
        )
    }

    private func swizzle(
        originalSelector: Selector,
        swizzledSelector: Selector,
        shouldAssertIfMethodIsSwizzledOnlyOneTime: Bool)
    {
        assertingSwizzler.swizzle(
            class: UITableView.self,
            originalSelector: originalSelector,
            swizzledSelector: swizzledSelector,
            methodType: .instanceMethod,
            shouldAssertIfMethodIsSwizzledOnlyOneTime: shouldAssertIfMethodIsSwizzledOnlyOneTime
        )
    }
}

private var cellsState_associatedObjectKey = "UITableView_cellsState_297BF7468EC6"
private var cachedFakeCells_associatedObjectKey = "UITableView_cachedFakeCells_5F3FCE1CB0A0"

extension UITableView {
    @objc override open func testabilityValue_children() -> [UIView] {
        return tableViewSwizzler_accessibilityUserTestingChildren().compactMap { $0 as? UIView }
    }

    private func changeStateInEverySuperview(cellsState: UITableView.CellsState) {
        var pointer: UIView? = self

        while let view = pointer {
            if let tableView = view as? UITableView {
                tableView.cellsState = cellsState
            }

            if let tableView = (view as? UITableViewCell)?.mb_fakeCellInfo?.parentTableView {
                pointer = tableView
            } else {
                pointer = superview
            }
        }
    }

    func startTableViewUpdates() {
        changeStateInEverySuperview(cellsState: .realCellsAreUpdating_fakeCellsCacheDoesNotExist)
    }

    func completeTableViewUpdates() {
        changeStateInEverySuperview(cellsState: .realCellsAreUpdated_fakeCellsCacheDoesNotExist)
    }
}

fileprivate extension UITableView {
    enum CellsState: String {
        // TODO: Make better structure of the state and put cache inside one of the cases to make state consistent.
        case realCellsAreUpdating_fakeCellsCacheDoesNotExist // to not do anything, because state is not consistent
        case realCellsAreUpdated_fakeCellsCacheDoesNotExist // to update cache
        case realCellsAreUpdated_fakeCellsCacheIsUpdating // basically to prevent stackoverflow
        case realCellsAreUpdated_fakeCellsCacheIsUpdated // to use cache
        case fakeCellsCacheCanNotBeObtained // to not use cache

        var needToUpdateCache: Bool {
            switch self {
            case .realCellsAreUpdated_fakeCellsCacheDoesNotExist:
                return true
            case .realCellsAreUpdating_fakeCellsCacheDoesNotExist,
                 .fakeCellsCacheCanNotBeObtained,
                 .realCellsAreUpdated_fakeCellsCacheIsUpdating,
                 .realCellsAreUpdated_fakeCellsCacheIsUpdated:
                return false
            }
        }

        var needToIgnoreCache: Bool {
            switch self {
            case .realCellsAreUpdating_fakeCellsCacheDoesNotExist,
                 .realCellsAreUpdated_fakeCellsCacheIsUpdating,
                 .fakeCellsCacheCanNotBeObtained:
                return true
            case .realCellsAreUpdated_fakeCellsCacheDoesNotExist,
                 .realCellsAreUpdated_fakeCellsCacheIsUpdated:
                return false
            }
        }
    }

    private var cachedFakeCells: [UITableViewCell] {
        get {
            guard let value = objc_getAssociatedObject(self, &cachedFakeCells_associatedObjectKey) as? [UITableViewCell] else {
                let initialValue = [UITableViewCell]()
                objc_setAssociatedObject(
                    self,
                    &cachedFakeCells_associatedObjectKey,
                    initialValue,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
                return initialValue
            }

            return value
        }
        set {
            objc_setAssociatedObject(
                self,
                &cachedFakeCells_associatedObjectKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    private var cellsState: CellsState {
        get {
            let initialValue = CellsState.realCellsAreUpdated_fakeCellsCacheDoesNotExist
            guard let value = objc_getAssociatedObject(self, &cellsState_associatedObjectKey) as? String else {
                objc_setAssociatedObject(
                    self,
                    &cellsState_associatedObjectKey,
                    initialValue.rawValue,
                    objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
                return initialValue
            }

            return CellsState(rawValue: value) ?? initialValue
        }
        set {
            objc_setAssociatedObject(
                self,
                &cellsState_associatedObjectKey,
                newValue.rawValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    @objc func swizzled_TableViewSwizzler_reloadData() {
        cellsState = .realCellsAreUpdating_fakeCellsCacheDoesNotExist
        swizzled_TableViewSwizzler_reloadData()
        cellsState = .realCellsAreUpdated_fakeCellsCacheDoesNotExist
    }

    @objc func swizzled_tableViewSwizzler_endUpdates() {
        cellsState = .realCellsAreUpdating_fakeCellsCacheDoesNotExist
        swizzled_tableViewSwizzler_endUpdates()
        cellsState = .realCellsAreUpdated_fakeCellsCacheDoesNotExist
    }

    // TODO: Cache subviews, this function should not be called for every accessibility element
    func getAccessibilityElements() -> [NSObject] {
        var tableViewCells = [UIView]()
        var visibleCells = Set<UIView>()

        for fakeCell in cachedFakeCells {
            let cell: UIView

            assert(fakeCell.mb_fakeCellInfo != nil)

            if let indexPath = fakeCell.mb_fakeCellInfo?.indexPath,
                let visibleCell = cellForRow(at: indexPath)
            {
                cell = visibleCell
                visibleCells.insert(visibleCell)
            } else {
                cell = fakeCell
            }
            tableViewCells.append(cell)
        }

        let allSubviewsThatAreNotCells = subviews.filter { view in
            // TODO: We can add a UITableVIewCell with addSubview as well.
            // I know it is bad to add a cell via addSubview method instead of
            // via collection view interfaces, but is still possible...
            //
            // But we are filtering out all cells, because it is hard to distinguish between
            // cells that are used privatly by collection view for animations and cells that
            // app adds via addSubview.
            //
            // For example, there was different code, but we got tens of extra elements in hierarchy:
            //
            // !visibleCells.contains(view)

            !(view is UITableViewCell)
        }

        // TODO: Better mixing cells
        //
        // How it is working now:
        // fakeCell1 visibleCell1 visibleCell2 fakeCell2 fakeCell3 | subview1 subview1 subview3
        //
        // How it should working:
        // subview1 fakeCell1 visibleCell1 subview2 visibleCell2 fakeCell2 fakeCell3 subview3

        return (tableViewCells + allSubviewsThatAreNotCells).map { cell in
            if let cell = cell as? UITableViewCell {
                if let indexPath = cell.mb_fakeCellInfo?.indexPath {
                    if let visibleCell = cellForRow(at: indexPath) {
                        return visibleCell
                    }
                }
            }

            return cell
        }
    }

    @nonobjc func tableViewSwizzler_accessibilityElementCount() -> Int {
        if cellsState.needToIgnoreCache {
            return swizzled_tableViewSwizzler_accessibilityElementCount()
        }
        if cellsState.needToUpdateCache {
            updateAccessibilityElements()
        }
        return getAccessibilityElements().count
    }

    @nonobjc func tableViewSwizzler_accessibilityElement(at index: Int) -> Any? {
        if cellsState.needToIgnoreCache {
            return swizzled_TableViewSwizzler_accessibilityElement(at: index)
        }
        if cellsState.needToUpdateCache {
            updateAccessibilityElements()
        }
        return getAccessibilityElements().mb_elementAtIndex(index)
    }

    @nonobjc func tableViewSwizzler_index(ofAccessibilityElement element: Any) -> Int {
        if cellsState.needToIgnoreCache {
            return swizzled_TableViewSwizzler_index(ofAccessibilityElement: element)
        }
        if cellsState.needToUpdateCache {
            updateAccessibilityElements()
        }

        var index = (subviews as NSArray).index(of: element)
        if index == NSNotFound {
            index = (accessibilityElements as NSArray?)?.index(of: element) ?? NSNotFound
        }
        return index
    }

    @nonobjc func tableViewSwizzler_accessibilityUserTestingChildren() -> NSArray {
        if cellsState.needToIgnoreCache {
            return swizzled_TableViewSwizzler_accessibilityUserTestingChildren()
        }
        if cellsState.needToUpdateCache {
            updateAccessibilityElements()
        }

        return getAccessibilityElements() as NSArray
    }

    // TODO: Split. swiftlint:disable:next function_body_length
    @nonobjc private func updateAccessibilityElements() {
        assert(cellsState == .realCellsAreUpdated_fakeCellsCacheDoesNotExist)
        cellsState = .realCellsAreUpdated_fakeCellsCacheIsUpdating

        // Without calling `reuseCell` dequeueing of cells will lead to leaks, new cells will
        // appear hidden in real view hierarchy.
        for fakeCell in self.cachedFakeCells {
            ObjectiveCExceptionCatcher.catch(
                try: {
                    _reuseCell(fakeCell, withIndexPath: fakeCell.mb_fakeCellInfo?.indexPath, didEndDisplaying: false)
                    fakeCell.mb_fakeCellInfo = nil
            },
                catch: { _ in }
            )
        }

        self.cachedFakeCells = []

        var cachedFakeCells = [UITableViewCell]()

        ObjectiveCExceptionCatcher.catch(
            try: {
                if let dataSource = dataSource {
                    for sectionId in 0..<numberOfSections {
                        for itemId in 0..<numberOfRows(inSection: sectionId) {
                            let indexPath = IndexPath(row: itemId, section: sectionId)

                            let fakeCell = FakeCellManagerProvider.fakeCellManager.createFakeCellInside {
                                // Usage of native function to create cell for a specific index path.
                                // It has some problems that were solved via swizzling of UITableVIewCell.
                                dataSource.tableView(
                                    self,
                                    cellForRowAt: indexPath
                                )
                            }
                            fakeCell.frame = self.rectForRow(at: indexPath)

                            let cellInfo = FakeTableCellInfo(
                                indexPath: indexPath,
                                parentTableView: self
                            )


                            if  dataSource.tableView(self, cellForRowAt: indexPath) == fakeCell {
                                cellInfo.cellWithReuse = false
                            } else {
                                // `collectionView(_:cellForItemAt:)` can add subview to collection view.
                                // I think there is no logic for that, and I think Apple did it because they thought
                                // that `collectionView(_:cellForItemAt:)` should always be followed by
                                // adding cell as subview. Note that this behavior is not constant, in fact
                                // usually cell is not added to collection view.
                                fakeCell.removeFromSuperview()
                                fakeCell._setHidden(forReuse: false)

                                assert(!fakeCell.isNotFakeCellDueToPresenceInViewHierarchy())
                            }
                            fakeCell.mb_fakeCellInfo = cellInfo
                            fakeCell.mb_configureAsFakeCell?()
                            // It wouldn't be called without a parent.
                            // But it is needed to set a frame. Elements with zero frame are not shown in AX hierarchy.
                            fakeCell.setNeedsLayout()
                            fakeCell.layoutIfNeeded()

                            cachedFakeCells.append(fakeCell)
                        }
                    }
                }

                self.cachedFakeCells = cachedFakeCells
                cellsState = .realCellsAreUpdated_fakeCellsCacheIsUpdated
        },
            catch: { _ in
                for fakeCell in self.cachedFakeCells {
                    ObjectiveCExceptionCatcher.catch(
                        try: {
                            _reuseCell(fakeCell, withIndexPath: fakeCell.mb_fakeCellInfo?.indexPath, didEndDisplaying: false)
                            fakeCell.mb_fakeCellInfo = nil
                    },
                        catch: { _ in
                            // TODO: Notify via assertion failure.
                    }
                    )
                }

                self.cachedFakeCells = []
                cellsState = .fakeCellsCacheCanNotBeObtained
        }
        )
    }
}

// Note that we use extension on UIView. Because we don't want to know for sure what class implements
// a certain method if the method is defined in UIView.
//
// E.g. `_accessibilityUserTestingChildren` method is implemented in UIView and trying to implicitly cast (access)
// `self` as UICollectionView will lead to a crash. Also it is something that may change. We want to be
// tolerant to where the method is actually implemented.
private extension UIView {
    @objc func swizzled_tableViewSwizzler_accessibilityElementCount() -> Int {
        guard let tableView = self as? UITableView else {
            return swizzled_tableViewSwizzler_accessibilityElementCount()
        }

        return ObjectiveCExceptionCatcher.catch(
            try: {
                tableView.tableViewSwizzler_accessibilityElementCount()
        },
            catch: { _ in
                swizzled_tableViewSwizzler_accessibilityElementCount()
        }
        )
    }

    @objc func swizzled_TableViewSwizzler_accessibilityElement(at index: Int) -> Any? {
        guard let tableView = self as? UITableView else {
            return swizzled_TableViewSwizzler_accessibilityElement(at: index)
        }

        return ObjectiveCExceptionCatcher.catch(
            try: {
                tableView.tableViewSwizzler_accessibilityElement(at: index)
        },
            catch: { _ in
                swizzled_TableViewSwizzler_accessibilityElement(at: index)
        }
        )
    }

    @objc func swizzled_TableViewSwizzler_index(ofAccessibilityElement element: Any) -> Int {
        guard let tableView = self as? UITableView else {
            return swizzled_TableViewSwizzler_index(ofAccessibilityElement: element)
        }

        return ObjectiveCExceptionCatcher.catch(
            try: {
                tableView.tableViewSwizzler_index(ofAccessibilityElement: element)
        },
            catch: { _ in
                swizzled_TableViewSwizzler_index(ofAccessibilityElement: element)
        }
        )
    }

    @objc func swizzled_TableViewSwizzler_accessibilityUserTestingChildren() -> NSArray {
        guard let tableView = self as? UITableView else {
            return swizzled_TableViewSwizzler_accessibilityUserTestingChildren()
        }

        return ObjectiveCExceptionCatcher.catch(
            try: {
                tableView.tableViewSwizzler_accessibilityUserTestingChildren()
        },
            catch: { _ in
                swizzled_TableViewSwizzler_accessibilityUserTestingChildren()
        }
        )
    }
}

#endif
