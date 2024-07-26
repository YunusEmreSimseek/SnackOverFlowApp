//
//  GoogleButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import SwiftUI

struct GoogleButton: View {
    let onTap: () -> Void
    var body: some View {
        SignInButton(
            onTap: onTap,
            icon: Icons.Social.google,
            text: LocaleKeys.Auth.google.rawValue,
            fgColor: .white,
            textColor: .gray
        )
    }
}
