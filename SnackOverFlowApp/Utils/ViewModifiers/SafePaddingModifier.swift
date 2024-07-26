//
//  SafePaddingModifier.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import Foundation
import SwiftUI

struct SafePaddingModifier: ViewModifier {
    func body(content: Content) -> some View {
        let size = GlobalScreenSize.size
        return
            content
//            .frame(
//                maxWidth: size.width - size.dynamicWidth(width: 0.1),
//                maxHeight: size.height - size.dynamicHeight(height: 0.1)
//            )
            .padding(.horizontal,size.dynamicWidth(width: 0.05))
            .padding(.vertical,size.dynamicHeight(height: 0.05))
    }
}


