//
//  NavBackButtonHiddenModifier.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 23.07.2024.
//

import Foundation
import SwiftUI

// This modifier is used to hide the toolbar in the navigation bar.
struct ViewToolBarHiddenModifier: ViewModifier {
    func body(content: Content) -> some View {
        // Check if the iOS version is 16.0 or
        if #available(iOS 16.0, *) {
            return content.toolbar(.hidden, for: .automatic)
        }
        else {
            return content.navigationBarBackButtonHidden(true)
        }

    }
}
