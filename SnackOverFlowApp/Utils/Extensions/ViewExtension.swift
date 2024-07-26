//
//  ViewExtension.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import Foundation
import SwiftUI

extension View {

    func paddingAll(value: Paddings = Paddings.low) -> some View {

    
        return self.padding(
            EdgeInsets.init(top: value.rawValue, leading: value.rawValue, bottom: value.rawValue, trailing: value.rawValue)
        )

    }

    func hPadding(value: Paddings = Paddings.low) -> some View {
        return self.padding(.horizontal, value.rawValue)
    }
    
    func vPadding(value: Paddings = Paddings.low) -> some View {
        return self.padding(.vertical, value.rawValue)
    }
}
