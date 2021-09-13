//
//  UserMiddleware.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore

struct UserMiddleware: Middleware {

    func onNext(for state: UserState, action: UserAction, interceptor: Interceptor<UserAction, UserState>, dispatcher: Dispatcher) {

        switch action {
        case .login(let firstName, let lastName):
            //eg. do network request for the user ?
            let user = User(firstName: firstName, lastName: lastName)
            interceptor.next(action: .set(user: user)) { _ in
                dispatcher.dispatch(action: NavigationTab.home.action)
            }
        case .logout:
            interceptor.next(action: .set(user: nil)) { _ in
                dispatcher.dispatch(action: NavigationAction.showOnboarding)
            }
        default: interceptor.next()
        }
    }
}
