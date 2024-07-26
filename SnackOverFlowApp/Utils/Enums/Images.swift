//
//  Images.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import Foundation
import SwiftUI

enum Images: String {
    case juice = "juice"
    case deliver = "deliver"
    case handpick = "handpick"
    case shop = "shop"
    case wolcano = "wolcano"
    

    func toImage() -> Image {
        return Image("img_\(self.rawValue)")
    }
    
    func toName() -> String {
        return "img_\(self.rawValue)"
    }
}
