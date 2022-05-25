//
//  NavigationTab.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import ReMVVMExt
import SwiftUI

enum NavigationTab: String, TabNavigationItem, CaseIterableNavigationItem {
    case home = "Home"
    case tests = "Tests"
    case profile = "Profile"


    public var tabViewFactory: () -> AnyView {
        switch self {
        case .home: return { HomeView().any }
        case .tests: return { CounterView().any }
        case .profile: return { ProfileView().any }
        }
    }

    @ViewBuilder public var tabItemFactory: AnyView {
        switch self {
        default: NavigationItemView(tab: self).any
        }
    }
}

