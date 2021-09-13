//
//  HomeView.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Combine
import ReMVVMSwiftUI
import ReMVVMExt
import SwiftUI

struct HomeView: View {

    @ReMVVM.ViewModel private var viewModel: HomeViewModel!

    var body: some View {
        VStack {
            Text("Welcome !!!")
                .padding(.bottom)
            Text(viewModel.name)
        }
    }
}

final class HomeViewModel: ObservableObject, Initializable {
    @Published private(set) var name = ""
    @ReMVVM.State private var user: UserState?

    init() {
        $user
            .compactMap{ $0.user }
            .map { "\($0.firstName) \($0.lastName)" }
            .assign(to: &$name)
    }
}
