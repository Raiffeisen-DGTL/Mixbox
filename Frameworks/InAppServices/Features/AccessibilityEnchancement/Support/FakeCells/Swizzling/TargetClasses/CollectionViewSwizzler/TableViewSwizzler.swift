//
//  TableViewSwizzler.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES

public protocol TableViewSwizzler: class {
    func swizzle()
}

#endif

