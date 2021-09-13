//
//  SceneDelegate.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 08/10/2019.
//  Copyright © 2019 Dariusz Grzeszczak. All rights reserved.
//

import UIKit
import SwiftUI
import ReMVVMCore
import ReMVVMExt
import Combine

struct AppConfigurator {
    static func setupStore() -> AnyStore {

        let middleware: [AnyMiddleware] = [
            NavigationMiddleware(),
            UserMiddleware()
        ]
        let mappers: [StateMapper<ApplicationState>] = [
            StateMapper(for: \.counter),
            StateMapper(for: \.user)
        ]
        let store = ReMVVM.initialize(with: .initial,
                                      stateMappers: mappers,
                                      reducer: ApplicationReducer.self,
                                      middleware: middleware)

        store.dispatch(action: NavigationAction.showOnboarding)
        return store.any
    }
}
#if DEBUG
struct MainViewPreview: PreviewProvider {
    static var previews: some View {
        MainView().source(with: AppConfigurator.setupStore())
    }
}
#endif

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?



    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).


        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            let store = AppConfigurator.setupStore()
            let view = MainView().source(with: store)

            window.rootViewController = UIHostingController(rootView: view)
            self.window = window
            window.makeKeyAndVisible()
        }

    }
}
