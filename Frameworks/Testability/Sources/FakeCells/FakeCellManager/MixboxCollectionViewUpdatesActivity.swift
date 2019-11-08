#if MIXBOX_ENABLE_IN_APP_SERVICES

public protocol MixboxCollectionViewUpdatesActivity: class {
    func complete()
}

public protocol MixboxTableViewUpdatesActivity: class {
    func complete()
}

#endif
