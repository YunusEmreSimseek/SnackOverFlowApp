//
//  SignUpButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 20.07.2024.
//

import SwiftUI

struct RegisterEmailButton: View {
    let onTap: () -> Void
    var body: some View {

        ShapedTextButton(
            onTap: onTap,
            title: LocaleKeys.Auth.registerEmail.rawValue,
            textColor: Color.cPeach,
            bgColor: .white
        )
    }

}
