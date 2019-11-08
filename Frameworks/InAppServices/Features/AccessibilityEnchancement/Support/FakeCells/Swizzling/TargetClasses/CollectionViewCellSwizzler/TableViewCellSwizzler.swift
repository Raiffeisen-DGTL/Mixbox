//
//  TableViewCellSwizzler.swift
//  MixboxInAppServices
//
//  Created by ANTROPOV Evgeny on 24.09.2019.
//

#if MIXBOX_ENABLE_IN_APP_SERVICES

import MixboxTestability
import MixboxFoundation

public protocol TableViewCellSwizzler: class {
    func swizzle()
}

#endif

