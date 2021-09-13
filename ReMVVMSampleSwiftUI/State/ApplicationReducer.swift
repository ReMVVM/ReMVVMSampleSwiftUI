//
//  ApplicationReducer.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 31/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore

struct ApplicationReducer: Reducer {

    static func reduce(state: ApplicationState, with action: StoreAction) -> ApplicationState {
        ApplicationState(
            counter: CounterReducer.reduce(state: state.counter, with: action),
            user: UserReducer.reduce(state: state.user, with: action)
        )
    }
}
