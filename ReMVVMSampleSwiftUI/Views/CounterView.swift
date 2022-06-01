//
//  TestView.swift
//  SwiftUITest
//
//  Created by Dariusz Grzeszczak on 25/05/2021.
//  Copyright © 2021 Dariusz Grzeszczak. All rights reserved.
//

import Combine
import ReMVVMSwiftUI
import ReMVVMExt
import SwiftUI

struct CounterView: View {

    @ReMVVM.ViewModel private var viewModel: CounterViewModel!
    @ReMVVM.Dispatcher private var dispatcher

    var body: some View {
        VStack {
            VStack {
                Text("View id: \(viewModel.id)")
                Text("Counter: \(viewModel.counter)")

                Button(action: dispatcher[CounterAction.increase]) {
                    Text("Increase")
                }
                Button(action: dispatcher[CounterAction.decrease]) {
                    Text("Decrease")
                }
            }.padding(.bottom)

            VStack(spacing: 15) {
                Text("Navigation: -> new CounterView")
                VStack(spacing: 3) {
                    Button(action: dispatcher[Push(with: CounterView())]) {
                        Text("Push new")
                    }
                    Button(action: dispatcher[Pop()]) {
                        Text("Pop")
                    }
                    Button(action: dispatcher[Pop(mode: .pop(3))]) {
                        Text("Pop3")
                    }
                    Button(action: dispatcher[Pop(mode: .popToRoot)]) {
                        Text("Pop to root")
                    }
                    SAButton(action: Pop(mode: .popToRoot)) {
                        Text("Pop to root")
                    }
                }
                VStack(spacing: 3) {
                    Button(action: dispatcher[ShowModal(view: CounterView(), presentationStyle: .sheet)]) {
                        Text("Show new on modal")
                    }
                    Button(action: dispatcher[ShowModal(view: CounterView(), navigation: true, presentationStyle: .sheet)]) {
                        Text("Show new on modal with nav")
                    }
                    Button(action: dispatcher[ShowModal(view: CounterView())]) {
                        Text("Show new on fs modal")
                    }
                    Button(action: dispatcher[ShowModal(view: CounterView(), navigation: true)]) {
                        Text("Show new on fs modal with nav")
                    }
                }
                VStack(spacing: 3) {
                    Button(action: dispatcher[DismissModal()]) {
                        Text("Dismiss modal")
                    }
                    Button(action: dispatcher[DismissModal(mode: .dismiss(2))]) {
                        Text("Dismiss 2 modals")
                    }
                    Button(action: dispatcher[DismissModal(mode: .all)]) {
                        Text("Dismiss all modals")
                    }
                }
                VStack(spacing: 3) {
                    Button(action: dispatcher[Show(on: Navigation.root, view: CounterView())]) {
                        Text("Show new on root")
                    }
                    Button(action: dispatcher[NavigationTab.profile.action]) {
                        Text("Show profile tab")
                    }
                }
            }
        }
        .navigationTitle("View: \(viewModel.id)")
    }
}

struct SAButton<Label>: View where Label: View {
    @ReMVVM.Dispatcher private var dispatcher

    private let action: StoreAction
    private let label: () -> Label

    var body: some View {
        Button(action: { dispatcher.dispatch(action: action) }, label: label)
    }

    public init(action: StoreAction, @ViewBuilder label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
}

final class CounterViewModel: ObservableObject, Initializable /*, StateObserver*/ {

    @Published private(set) var counter: String = ""

    @ReMVVM.State private var state: Int?

    required init() {
        $state.map(String.init).assign(to: &$counter)
    }

//    func didReduce(state: Int, oldState: Int?) {
//        counter = String(state)
//    }

    private static var nextId = 0
    let id: Int = {
        defer { nextId += 1}
        return nextId
    }()
}

#if DEBUG

struct CounterViewPreview: PreviewProvider {

    static var previews: some View {

            CounterView().source(with: .test(with: 46,
                                             reducer: CounterReducer.self))
    }
}
#endif
