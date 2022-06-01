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

        let tabBarConfig = NavigationConfig(tabBarFactory: { items, selectedIndex in
            TestTabBar(items: items, selectedIndex: selectedIndex).any
        })

        let uiStateConfig = UIStateConfig(navigationConfigs: tabBarConfig)

        let store = ReMVVM.initialize(with: .initial,
                                      stateMappers: mappers,
                                      uiStateConfig: uiStateConfig,
                                      reducer: ApplicationReducer.self,
                                      middleware: middleware)

        store.dispatch(action: NavigationAction.showOnboarding)
        return store.any
    }
}

private struct TestTabBar: View {
    var items: [AnyView]
    @Binding var selectedIndex: Int

    var body: some View {
        HStack {
            ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
                item
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 0.2)) {
                            selectedIndex = index
                        }
                    }
                    .offset(x: 0, y: selectedIndex == index ? -10 : 0)
            }
        }
        .background(Color.red)
        .frame(height: 90)
    }
}
