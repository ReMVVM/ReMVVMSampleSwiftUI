//
//  NavigationMiddleware.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore
import ReMVVMExt

struct NavigationMiddleware: ConvertMiddleware {

    func onNext(for state: ApplicationState, action: NavigationAction, dispatcher: Dispatcher) {
        let storeAction: StoreAction
        switch action {
        case .showLogin: storeAction = Show(on: Navigation.root, view: LoginView())
        case .showOnboarding: storeAction = Show(on: Navigation.root, view: OnboardingView())
        case .showHome: storeAction = NavigationTab.home.action
        }

        dispatcher.dispatch(action: storeAction)
    }
}
