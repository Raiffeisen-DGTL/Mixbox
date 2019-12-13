//
//  FakeTableCellInfo.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxFoundation
import UIKit

final class FakeTableCellInfo {
    var cellWithReuse = true
    let indexPath: IndexPath
    var parentTableView: UITableView? {
        return parentTableViewBox.value
    }

    private let parentTableViewBox: WeakBox<UITableView>

    init(
        indexPath: IndexPath,
        parentTableView: UITableView)
    {
        self.indexPath = indexPath
        self.parentTableViewBox = WeakBox<UITableView>(parentTableView)
    }
}

#endif

