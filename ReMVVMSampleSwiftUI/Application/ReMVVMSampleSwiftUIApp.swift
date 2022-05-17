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

@main
struct ReMVVMSampleSwiftUIApp: App {
    let store = AppConfigurator.setupStore()

    var body: some Scene {
        WindowGroup {
            MainView().source(with: store)
        }
    }
}


#if DEBUG
struct ReMVVMSampleSwiftUIAppPreview: PreviewProvider {
    static var previews: some View {
        Group {
            MainView().source(with: AppConfigurator.setupStore())
        }
    }
}
#endif
