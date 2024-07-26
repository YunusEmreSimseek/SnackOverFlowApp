//
//  LoginWithEmailView.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import SwiftUI

struct LoginWithEmailView: View {
    @StateObject var loginVM: LoginViewModel = LoginViewModel()
    private let screenSize: CGSize = GlobalScreenSize.size

    var body: some View {

        NavigationStack {

            VStack(alignment: .center) {
                Spacer()
                Image(Images.wolcano.toName())
                Text(LocaleKeys.Login.welcome.locale())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.cTeflon)
                    .padding(.bottom, screenSize.dynamicHeight(height: 0.05))
                EmailTextField(text: $loginVM.emailValue)
                    .padding(.bottom, screenSize.dynamicHeight(height: 0.005))
                PasswordTextField(text: $loginVM.passwordValue)
                    .padding(.bottom, screenSize.dynamicHeight(height: 0.025))

                ShapedTextButton(
                    onTap: {
                        Task {
                            await loginVM.onLoginUser()
                        }
                    },
                    title: LocaleKeys.Login.buttonTitle,
                    textColor: .primary,
                    bgColor: .cPeach
                )
                .navigationDestination(
                    isPresented: $loginVM.isLoggedIn,
                    destination: {
                        MainTabView()
                            .modifier(ViewToolBarHiddenModifier())
                    }
                )
                .font(.system(size: FontSizes.caption1, weight: .regular))
                .foregroundStyle(.cGandalf)
                .tint(.cCornFlowerBlue)
                Spacer()
            }
            .modifier(SafePaddingModifier())
        }

    }

}

#Preview {
    LoginWithEmailView()
        .toolbar(content: {
            Text("Toolbar")
        })
        .toolbar(.visible)
}
