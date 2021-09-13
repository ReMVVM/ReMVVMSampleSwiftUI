//
//  OnboardingView.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Combine
import ReMVVMSwiftUI
import ReMVVMExt
import SwiftUI

struct OnboardingView: View {

    @ReMVVM.ViewModel private var viewModel: OnboardingViewModel!
    @ReMVVM.Dispatcher private var dispatcher

    init() { }

    var body: some View {
        VStack {
            Text("Onbboarding page: \(viewModel.currentPage)")
                .padding(.bottom)
            Button {
                if viewModel.next() {
                    dispatcher.dispatch(action: NavigationAction.showLogin)
                }
            } label: {
                Text(viewModel.actionTitle)
            }
        }
    }
}

final class OnboardingViewModel: ObservableObject, Initializable {

    @Published private(set) var currentPage = 0
    @Published private(set) var numOfPages = 3
    var actionTitle: String { currentPage + 1 < numOfPages ? "Next" : "Enter" }

    func next() -> Bool {
        if currentPage + 1 == numOfPages {
            return true
        } else {
            currentPage += 1
            return false
        }
    }

    init() { }
}
