//
//  SignInEmailButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import SwiftUI

struct SignInEmailButton: View {
    let onTap: () -> Void
    var body: some View {
        SignInButton(
            onTap: onTap,
            icon: Icons.Social.email,
            text: LocaleKeys.Auth.email.rawValue,
            fgColor: .cPeach,
            textColor: .white
        )
    }
}
