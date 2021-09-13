//
//  LoginView.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Combine
import ReMVVMSwiftUI
import ReMVVMExt
import SwiftUI

struct LoginView: View {

    @ReMVVM.ViewModel var viewModel: LoginViewModel?
    @ReMVVM.Dispatcher private var dispatcher

    public var body: some View {
        if let viewModel = viewModel {

            VStack(alignment: .leading) {
                Text("First name:")
                TextField("type here", text: $viewModel.firstName)
                Text("Last name:")
                TextField("type here", text: $viewModel.lastName)
                    Button(action: dispatcher[UserAction
                                                .login(firstName: viewModel.firstName,
                                                       lastName: viewModel.lastName)]) {
                        Text("Login")
                    }.padding(.top)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        }
    }

    #if DEBUG
    struct Preview: PreviewProvider {

        static let vm: LoginViewModel = {
            let vm = LoginViewModel()
            vm.firstName = "dar"
            vm.lastName = "grz"
            return vm
        }()

        static var previews: some View {
            Group {
                LoginView()
                LoginView().source(with: .mock(viewModel: vm))
            }
        }
    }
    #endif
}

final class LoginViewModel: ObservableObject, Initializable {

    @Published var firstName = ""
    @Published var lastName = ""

    init() { }
}
