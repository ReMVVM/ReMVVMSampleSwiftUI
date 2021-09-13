//
//  UserReducer.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore

enum UserReducer: Reducer {

    static func reduce(state: UserState, with action: UserAction) -> UserState {
        if case .set(let user) = action { return UserState(user: user) }
        return state
    }
}
