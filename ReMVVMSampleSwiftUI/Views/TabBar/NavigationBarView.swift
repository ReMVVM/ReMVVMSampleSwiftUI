//
//  NavigationBarView.swift
//  ReMVVMSampleSwiftUI
//
//  Created by Paweł Zgoda-Ferchmin on 11/08/2022.
//  Copyright © 2022 Dariusz Grzeszczak. All rights reserved.
//

import Foundation
import SwiftUI
import ReMVVMExt

struct NavigationBarView: View {
    var items: [TabNavigationItem]
    @Binding var selectedIndex: Int?

    var body: some View {
        HStack {
            ForEach(Array(zip(items.indices, items)), id: \.0) { index, item in
                item.tabItemFactory()
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
