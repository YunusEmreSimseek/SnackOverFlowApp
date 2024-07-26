//
//  FacebookButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import SwiftUI

struct FacebookButton: View {

    var onTap: () -> Void

    var body: some View {
        SignInButton(
            onTap: {
                onTap()
            },
            icon: Icons.Social.facebook,
            text: LocaleKeys.Auth.facebook.rawValue,
            fgColor: .cDeepSkyBlue,
            textColor: .white
        )
    }
}
