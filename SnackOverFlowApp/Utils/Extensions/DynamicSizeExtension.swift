//
//  DynamicSizeExtension.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import Foundation
import SwiftUI

extension CGSize {
    /// Dynamic Height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    func dynamicHeight(height: Double) -> Double {
        return self.height * height
    }

    /// Dynamic Width by device
    /// - Parameter Width: Percent value
    /// - Returns: Calculated value for device Width
    func dynamicWidth(width: Double) -> Double {
        return self.width * width
    }
}