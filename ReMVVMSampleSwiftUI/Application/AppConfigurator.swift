//
//  AppConfigurator.swift
//  ReMVVMSampleSwiftUI
//
//  Created by Paweł Zgoda-Ferchmin on 17/05/2022.
//  Copyright © 2022 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore
import ReMVVMExt
import SwiftUI

struct AppConfigurator {
    static func setupStore() -> AnyStore {
        let middleware: [AnyMiddleware] = [NavigationMiddleware(),
                                           UserMiddleware()]
        let mappers: [StateMapper<ApplicationState>] = [StateMapper(for: \.counter),
                                                        StateMapper(for: \.user)]

        let tabBarConfig = NavigationConfig(tabBarFactory: { NavigationBarView(items: $0, selectedIndex: $1) })
        let uiStateConfig = UIStateConfig(navigationConfig: tabBarConfig)
        let store = ReMVVM.initialize(with: .initial,
                                      stateMappers: mappers,
                                      uiStateConfig: uiStateConfig,
                                      reducer: ApplicationReducer.self,
                                      middleware: middleware)

        store.dispatch(action: NavigationAction.showOnboarding)
        return store.any
    }
}
