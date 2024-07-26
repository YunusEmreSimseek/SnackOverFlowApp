//
//  SignInButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import SwiftUI

struct SignInButton: View {
    var onTap: () -> Void
    let icon: Icons.Social
    let text: String
    let fgColor: Color
    let textColor: Color
    private let size: CGSize = GlobalScreenSize.size
    var body: some View {
        Button(
            action: onTap,
            label: {
                HStack {
                    Image(icon.toIconName())
                    Text(text.locale()).foregroundStyle(textColor)
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.vertical, size.dynamicHeight(height: 0.015))
                .padding(.horizontal, size.dynamicHeight(height: 0.03))
                .background(RoundedRectangle(cornerRadius: RadiusItems.Buttons.low2x))
            }
        )
        .padding(.zero)
        .foregroundStyle(fgColor)
    }

}

#Preview {
    SignInButton(
        onTap: {},
        icon: Icons.Social.apple,
        text: LocaleKeys.Auth.apple.rawValue,
        fgColor: .white,
        textColor: .red
    )

}
