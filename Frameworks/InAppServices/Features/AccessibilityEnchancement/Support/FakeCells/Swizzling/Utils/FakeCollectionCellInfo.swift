#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxFoundation
import UIKit

final class FakeCollectionCellInfo {
    let indexPath: IndexPath
    var parentCollectionView: UICollectionView? {
        return parentCollectionViewBox.value
    }
    
    private let parentCollectionViewBox: WeakBox<UICollectionView>
    
    init(
        indexPath: IndexPath,
        parentCollectionView: UICollectionView)
    {
        self.indexPath = indexPath
        self.parentCollectionViewBox = WeakBox<UICollectionView>(parentCollectionView)
    }
}

#endif
