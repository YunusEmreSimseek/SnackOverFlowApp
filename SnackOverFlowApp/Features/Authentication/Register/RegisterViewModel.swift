//
//  RegisterViewModel.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 23.07.2024.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Published var emailValue: String = "eve.holt@reqres.in"
    @Published var passwordValue: String = "cityslicka"
    @Published var token: String = "TOKEN"
    @Published var isLoggedIn: Bool = false
    private let networkManager = NetworkManager(
        config: NetworkConfig(baseUrl: NetworkPath.baseUrlReqres)
    )

    func onLoginUser() async {
        token = await onLoginUser(email: emailValue, password: passwordValue)
        isLoggedIn = !token.isEmpty
    }
}

protocol LoginUseCase2 {
    func onLoginUser(email: String, password: String) async -> String
    func onSaveUserToken(token: String) -> Bool
}

extension RegisterViewModel: LoginUseCase2 {

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
