//
//  GeometryProxy+DynamicSize.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 20.07.2024.
//

import SwiftUI

extension GeometryProxy {
    /// Dynamic Height by device
    /// - Parameter height: Percent value
    /// - Returns: Calculated value for device height
    func dynamicHeight(height:Double) -> Double {
        return size.height * height
    }
    
    /// Dynamic Width by device
    /// - Parameter Width: Percent value
    /// - Returns: Calculated value for device Width
    func dynamicWidth(width:Double) -> Double {
        return size.width * width
    }
}
