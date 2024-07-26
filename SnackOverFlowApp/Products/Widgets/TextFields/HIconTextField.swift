//
//  HIconTextField.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 22.07.2024.
//

import Foundation
import SwiftUI

struct HIconTextField: View {
    let icon: Icons.Fields
    let hint: String
    var text: Binding<String>

    var body: some View {
        HStack {
            Image(icon.toIconName())
            TextField(hint.locale(), text: text)
        }
        .modifier(TextFieldModifier())
    }
}
