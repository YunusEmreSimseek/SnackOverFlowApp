//
//  LoginViewModel.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 25.07.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isRegister: Bool = false
    @Published var isEmailLogin: Bool = false
    // eve.holt@reqres.in
    @Published var emailValue: String = "eve.holt@reqres.in"
    // cityslicka
    @Published var passwordValue: String = "cityslicka"
    @Published var token: String = ""
    @Published var isLoggedIn: Bool = false

    func changeIsRegister() {
        isRegister = !isRegister
    }

    func changeisEmailLogin() {
        isEmailLogin = !isEmailLogin
    }

    private let networkManager = NetworkManager(
        config: NetworkConfig(baseUrl: NetworkPath.baseUrlReqres)
    )

    func onLoginUser() async {
        token = await onLoginUser(email: emailValue, password: passwordValue)
        isLoggedIn = !token.isEmpty
    }
}

protocol LoginUseCase {
    func onLoginUser(email: String, password: String) async -> String
    func onSaveUserToken(token: String) -> Bool
}

extension LoginViewModel: LoginUseCase {

    func onLoginUser(email: String, password: String) async -> String {
        guard !emailValue.isEmpty || !passwordValue.isEmpty else {
            return ""
        }

        let response = await networkManager.post(
            path: .login,
            model: LoginRequest(email: email, password: password),
            type: LoginResponse.self
        )

        return response?.token ?? ""
    }

    func onSaveUserToken(token: String) -> Bool {
        // Generic database
        return false
    }

}
