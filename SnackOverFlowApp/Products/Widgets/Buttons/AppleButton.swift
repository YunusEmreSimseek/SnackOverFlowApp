//
//  AppleButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import SwiftUI

struct AppleButton: View {
    var onTap: () -> Void
    var body: some View {
        SignInButton(
            onTap: {
                onTap()
            },
            icon: Icons.Social.apple,
            text: LocaleKeys.Auth.apple.rawValue,
            fgColor: .black,
            textColor: .white
        )
    }
}
