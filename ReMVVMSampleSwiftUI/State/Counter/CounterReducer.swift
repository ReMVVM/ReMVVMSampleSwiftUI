//
//  CounterReducer.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore

enum CounterReducer: Reducer {

    static func reduce(state: Int, with action: CounterAction) -> Int {
        switch action {
        case .increase: return state + 1
        case .decrease: return state - 1
        }
    }
}
