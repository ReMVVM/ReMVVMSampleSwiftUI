//
//  NavigationItemView.swift
//  ReMVVMSampleSwiftUI
//
//  Created by Paweł Zgoda-Ferchmin on 24/05/2022.
//  Copyright © 2022 Dariusz Grzeszczak. All rights reserved.
//

import SwiftUI

struct NavigationItemView: View {
    public let tab: NavigationTab
    var body: some View {
        VStack {
            Image(uiImage: .add)
            Text(tab.rawValue)
        }
    }
}

struct NavigationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationItemView(tab: .home)
    }
}
