//
//  NavigationManager.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import Foundation
import SwiftUI

final class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()

    func goTo<Destination: Hashable>(_ destination: Destination) {
        path.append(destination)
    }

    func goBack() {
        path.removeLast()
    }

    func goToRoot() {
        path.removeLast(path.count)
    }
}

enum NavigationPaths: Hashable {
    case LoginView
    case LoginWithEmailView
    case RegisterView
    case OnBoardView
}
