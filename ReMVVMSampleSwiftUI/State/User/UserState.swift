//
//  UserState.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation

struct UserState {
    let user: User?

    static let initial = UserState(user: nil)
}

struct User {
    let firstName: String
    let lastName: String
}
