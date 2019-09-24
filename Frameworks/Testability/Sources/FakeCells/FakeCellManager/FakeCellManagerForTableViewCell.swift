//
//  FakeCellManagerForTableViewCell.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES

public protocol FakeCellManagerForTableViewCell: class {
    func isFakeCell(forCell: UITableViewCell) -> Bool
    func startTableViewUpdates(forTableView: UITableView) -> MixboxTableViewUpdatesActivity
    func getConfigureAsFakeCell(forCell: UITableViewCell) -> (() -> ())?
    func setConfigureAsFakeCell(configureAsFakeCell: (() -> ())?, forCell: UITableViewCell)
}

#endif

