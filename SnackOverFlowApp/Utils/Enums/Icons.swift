//
//  Icons.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import Foundation
import SwiftUI

protocol IconType: RawRepresentable where RawValue == String {}

extension IconType {
    func toIconName() -> String {
        return "ic_\(self.rawValue)"
    }
}

struct Icons {
    enum Social: String, IconType {
        case appLogo = "app_logo"
        case facebook = "facebook"
        case google = "google"
        case apple = "apple"
        case email = "email"
    }

    enum Fields: String, IconType {
        case email = "email"
        case password = "lock"
    }

    enum Tabs: String, IconType {
        case home = "home"
        case market = "market"
        case create = "create"
        case favourite = "favourite"
        case edit = "edit"
        case person = "person"
    }

}
