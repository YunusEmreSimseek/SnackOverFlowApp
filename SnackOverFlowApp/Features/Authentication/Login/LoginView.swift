//
//  WelcomeView.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 19.07.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Images.juice.toImage().resizable()
                Color.cBlack30
                BodyView()
            }
        }
    }
}

private struct BodyView: View {
    @StateObject var loginVM: LoginViewModel = LoginViewModel()
    private let screenSize: CGSize = GlobalScreenSize.size
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(Icons.Social.appLogo.toIconName())
                .padding(.bottom, screenSize.dynamicHeight(height: 0.05))
            FacebookButton {}
            GoogleButton {}
            AppleButton(onTap: {})
            SignInEmailButton(onTap: {
                loginVM.changeisEmailLogin()

            })
            .navigationDestination(isPresented: $loginVM.isEmailLogin) {
                LoginWithEmailView()
                    .modifier(ToolBarBackButtonModifier(destination: LoginView()))
            }

            Divider()
                .background(Color.cPeach)
                .frame(
                    width: screenSize.dynamicWidth(width: 0.6),
                    height: screenSize.dynamicHeight(height: 0.04)
                )
            RegisterEmailButton(onTap: {
                loginVM.changeIsRegister()

            })
            .navigationDestination(isPresented: $loginVM.isRegister) {
                RegisterView()
                    .modifier(ToolBarBackButtonModifier(destination: LoginView()))
            }
        }
        .modifier(SafePaddingModifier())

    }
}

#Preview {
    LoginView()
    //        .ignoresSafeArea(.all)
}
