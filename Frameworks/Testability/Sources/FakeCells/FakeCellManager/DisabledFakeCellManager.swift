#if MIXBOX_ENABLE_IN_APP_SERVICES

public final class DisabledFakeCellManager: FakeCellManager {

    public func createFakeCellInside(closure: () -> (UICollectionViewCell)) -> UICollectionViewCell {
        return closure()
    }
    
    public func isFakeCell(forCell: UICollectionViewCell) -> Bool {
        return false
    }
    public func startCollectionViewUpdates(forCollectionView: UICollectionView) -> MixboxCollectionViewUpdatesActivity {
        
        return  DisabledMixboxCollectionViewUpdatesActivity()
    }
    public func getConfigureAsFakeCell(forCell: UICollectionViewCell) -> (() -> ())? {
        return nil
    }
    public func setConfigureAsFakeCell(configureAsFakeCell: (() -> ())?, forCell: UICollectionViewCell) {
    }


    public func createFakeCellInside(closure: () -> (UITableViewCell)) -> UITableViewCell {
        return closure()
    }

    public func isFakeCell(forCell: UITableViewCell) -> Bool {
        return false
    }
    public func startTableViewUpdates(forTableView: UITableView) -> MixboxTableViewUpdatesActivity {
        return  DisabledMixboxTableViewUpdatesActivity()
    }
    public func getConfigureAsFakeCell(forCell: UITableViewCell) -> (() -> ())? {
        return nil
    }
    public func setConfigureAsFakeCell(configureAsFakeCell: (() -> ())?, forCell: UITableViewCell) {
    }
}

public final class DisabledMixboxCollectionViewUpdatesActivity: MixboxCollectionViewUpdatesActivity {
    public func complete() {
    }
}

public final class DisabledMixboxTableViewUpdatesActivity: MixboxTableViewUpdatesActivity {
    public func complete() {
    }
}


#endif
