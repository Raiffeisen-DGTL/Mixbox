//
//  FakeCellManagerForTableView.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES

public protocol FakeCellManagerForTableView: class {
    func createFakeCellInside(closure: () -> (UITableViewCell)) -> UITableViewCell
}

#endif
