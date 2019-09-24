#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxTestability

public final class MixboxCollectionViewUpdatesActivityImpl: MixboxCollectionViewUpdatesActivity {
    private let collectionView: UICollectionView
    private var completeWasCalled = false
    
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    public func complete() {
        collectionView.completeCollectionViewUpdates()
        completeWasCalled = true
    }
    
    deinit {
        assert(completeWasCalled, "You have to call complete() on object returned from startCollectionViewUpdates")
    }
}

public final class MixboxTableViewUpdatesActivityImpl: MixboxTableViewUpdatesActivity {
    private let tableView: UITableView
    private var completeWasCalled = false

    public init(tableView: UITableView) {
        self.tableView = tableView
    }

    public func complete() {
        tableView.completeTableViewUpdates()
        completeWasCalled = true
    }

    deinit {
        assert(completeWasCalled, "You have to call complete() on object returned from startCollectionViewUpdates")
    }
}


#endif
