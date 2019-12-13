#if MIXBOX_ENABLE_IN_APP_SERVICES

public final class FakeCellsSwizzlingImpl: FakeCellsSwizzling {
    private let collectionViewCellSwizzler: CollectionViewCellSwizzler
    private let collectionViewSwizzler: CollectionViewSwizzler
    private let tableViewCellSwizzler: TableViewCellSwizzler
    private let tableViewSwizzler: TableViewSwizzler

    public init(
        collectionViewCellSwizzler: CollectionViewCellSwizzler,
        collectionViewSwizzler: CollectionViewSwizzler,
        tableViewCellSwizzler: TableViewCellSwizzler,
        tableViewSwizzler: TableViewSwizzler)
    {
        self.collectionViewCellSwizzler = collectionViewCellSwizzler
        self.collectionViewSwizzler = collectionViewSwizzler
        self.tableViewCellSwizzler = tableViewCellSwizzler
        self.tableViewSwizzler = tableViewSwizzler
    }
    
    public func swizzle() {
        collectionViewCellSwizzler.swizzle()
        collectionViewSwizzler.swizzle()
        tableViewCellSwizzler.swizzle()
        tableViewSwizzler.swizzle()
    }
}

#endif
