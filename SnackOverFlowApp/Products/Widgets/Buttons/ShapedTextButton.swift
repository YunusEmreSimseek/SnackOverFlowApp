//
//  ShapedTextButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 21.07.2024.
//

import SwiftUI

struct ShapedTextButton: View {

    let onTap: () -> Void
    let title: String
    let textColor: Color
    let bgColor: Color
    private let size: CGSize = GlobalScreenSize.size
    var body: some View {
        Button(
            action: onTap,
            label: {
                HStack {
                    Spacer()
                    Text(title.locale())
                        .foregroundStyle(textColor)
                        .font(.subheadline)
                    Spacer()
                }
                .padding(.vertical, size.dynamicHeight(height: 0.02))
                .padding(.horizontal, size.dynamicHeight(height: 0.03))
                .fontWeight(.bold)

            }
        )
        .background(RoundedRectangle(cornerRadius: RadiusItems.Buttons.low2x))
        .foregroundStyle(bgColor)
    }
}

#Preview {
    ShapedTextButton(
        onTap: {},
        title: LocaleKeys.OnBoard.contentFirst.rawValue,
        textColor: .cPeach,
        bgColor: .white

    )
}
