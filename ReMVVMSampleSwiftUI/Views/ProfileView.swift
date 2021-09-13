//
//  ProfileView.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Combine
import ReMVVMSwiftUI
import SwiftUI

struct ProfileView: View {

    @ReMVVM.Dispatcher private var dispatcher

    var body: some View {
        Button(action: dispatcher[UserAction.logout]) {
            Text("Logout")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
