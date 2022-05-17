//
//  AppConfigurator.swift
//  ReMVVMSampleSwiftUI
//
//  Created by Paweł Zgoda-Ferchmin on 17/05/2022.
//  Copyright © 2022 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMCore

struct AppConfigurator {
    static func setupStore() -> AnyStore {
        let middleware: [AnyMiddleware] = [NavigationMiddleware(),
                                           UserMiddleware()]
        let mappers: [StateMapper<ApplicationState>] = [StateMapper(for: \.counter),
                                                        StateMapper(for: \.user)]

        let store = ReMVVM.initialize(with: .initial,
                                      stateMappers: mappers,
                                      reducer: ApplicationReducer.self,
                                      middleware: middleware)

        store.dispatch(action: NavigationAction.showOnboarding)
        return store.any
    }
}
