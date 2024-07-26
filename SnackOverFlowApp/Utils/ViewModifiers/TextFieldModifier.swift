//
//  TextFieldModifier.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 22.07.2024.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    private let screenSize: CGSize = GlobalScreenSize.size
    func body(content: Content) -> some View {

        return
            content
            .padding(.vertical, screenSize.dynamicHeight(height: 0.015))
            .padding(.horizontal, screenSize.dynamicWidth(width: 0.05))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 0.2)
            )
            .foregroundStyle(.cTeflon)
    }

}
