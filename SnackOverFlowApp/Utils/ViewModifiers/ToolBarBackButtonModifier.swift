//
//  ToolBarBackButtonModifier.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import Foundation
import SwiftUI

struct ToolBarBackButtonModifier<Destination: View>: ViewModifier {
    let destination: Destination
    func body(content: Content) -> some View {
        return
            content
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    NavBarBackButton(destination: destination)
                }
            })
    }
}
