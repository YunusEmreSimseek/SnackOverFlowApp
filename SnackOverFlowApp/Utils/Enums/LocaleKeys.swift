//
//  LocaleKeys.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import Foundation
import SwiftUI

struct LocaleKeys {
    
    struct Login {
        static let welcome = "loginWelcome"
        static let buttonTitle = "loginSignIn"
    }

    struct Register {
        static let welcome = "registerWelcome"
        static let buttonTitle = "registerCreateAccount"
    }

    struct TextFields {
        static let email = "textFieldEmail"
        static let password = "textFieldPassword"
    }

    enum Auth: String {
        case facebook = "signInWithFacebook"
        case google = "signInWithGoogle"
        case apple = "signInWithApple"
        case email = "signInWithEmail"
        case registerEmail = "signUpWithEmail"
        
    }

    enum OnBoard: String {
        case contentFirst = "onboardContentFirst"
        case contentSecond = "onboardContentSecond"
        case contentThird = "onboardContentThird"
        case buttonTitle = "onboardButtonTitle"
    }

    enum Tab: String {
        case home = "tabHome"
        case market = "tabMarket"
        case create = "tabCreate"
        case wishlist = "tabWishlist"
        case account = "tabAccount"
    }

}

extension String {
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }

}
