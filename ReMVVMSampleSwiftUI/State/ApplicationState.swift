//
//  ApplicationState.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//
import Foundation
import ReMVVMCore

struct ApplicationState {
    let counter: Int
    let user: UserState

    init(counter: Int, user: UserState = UserState(user: nil)) {
        self.counter = counter
        self.user = user
    }

    static let initial = ApplicationState(counter: 0, user: .initial)
}
