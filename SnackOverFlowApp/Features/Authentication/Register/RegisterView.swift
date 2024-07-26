//
//  RegisterView.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 22.07.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var registerVM = RegisterViewModel()
    private let screenSize: CGSize = GlobalScreenSize.size
    var body: some View {
        NavigationStack {
            VStack {
                Image(Images.wolcano.toName())
                Text(LocaleKeys.Register.welcome.locale())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.cTeflon)
                    .padding(.bottom, screenSize.dynamicHeight(height: 0.05))
                EmailTextField(text: $registerVM.emailValue)
                    .padding(.bottom, screenSize.dynamicHeight(height: 0.005))
                PasswordTextField(text: $registerVM.passwordValue)
                    .padding(.bottom, screenSize.dynamicHeight(height: 0.025))
                ShapedTextButton(
                    onTap: {
                        Task {
                            await registerVM.onLoginUser()
                        }
                    },
                    title: LocaleKeys.Register.buttonTitle,
                    textColor: .primary,
                    bgColor: .cPeach
                )
                .navigationDestination(
                    isPresented: $registerVM.isLoggedIn,
                    destination: {
                        MainTabView()
                            .modifier(ViewToolBarHiddenModifier())
                    }
                )
                .padding(.bottom, screenSize.dynamicHeight(height: 0.02))
                Text(
                    "By clicking \"Create account\", I agree to SnackOverflow’s [TOS](www.com.emre) and [Privacy Policy](www.com.emre2)."
                )
                .environment(
                    \.openURL,
                    OpenURLAction(handler: { url in
                        print(url)
                        return .discarded
                    })
                )
                .font(.system(size: FontSizes.caption1, weight: .regular))
                .foregroundStyle(.cGandalf)
                .tint(.cCornFlowerBlue)

            }
            .modifier(SafePaddingModifier())
        }
    }
}

#Preview {
    RegisterView()
}

struct EmailTextField: View {
    var text: Binding<String>
    var body: some View {
        HIconTextField(icon: Icons.Fields.email, hint: LocaleKeys.TextFields.email, text: text)
    }
}

struct PasswordTextField: View {
    var text: Binding<String>
    var body: some View {
        HSecureIconTextField(
            icon: Icons.Fields.password,
            hint: LocaleKeys.TextFields.password,
            text: text
        )
    }
}
