//
//  NavigationControlView.swift
//  2HW
//
//  Created by Данил Менделев on 24.09.2022.
//

import Foundation
import SwiftUI

struct NavigationControllerView<Content>: View where Content: View {
    @ObservedObject private var viewModel: NavigationControllerViewModel
    var content: Content
    var transition: (push: AnyTransition, pop: AnyTransition)

    init(
        viewModel: NavigationControllerViewModel = NavigationControllerViewModel(easing: .easeOut(duration: 0.4)),
        transition: NavigationAnimation,
        @ViewBuilder contentBuilder: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.content = contentBuilder()
        switch transition {
        case .none:
            self.transition = (.identity, .identity)
        case .custom(let pushAnim, let popAnim):
            self.transition = (pushAnim, popAnim)
        }
    }

    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            switch isRoot {
            case true:
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            case false:
                viewModel.currentScreen!.screenView
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
