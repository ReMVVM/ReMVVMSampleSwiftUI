//
//  UserAction.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore

enum UserAction: StoreAction {
    case login(firstName: String, lastName: String)
    case logout
    case set(user: User?)
    //case register
}
