//
//  OnBoardButton.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 21.07.2024.
//

import SwiftUI

struct OnBoardButton: View {
    let onTap: () -> Void
    var body: some View {
        ShapedTextButton(
            onTap: {
                onTap()
            },
            title: LocaleKeys.OnBoard.buttonTitle.rawValue,
            textColor: .primary,
            bgColor: .cPeach
        )
    }
}
