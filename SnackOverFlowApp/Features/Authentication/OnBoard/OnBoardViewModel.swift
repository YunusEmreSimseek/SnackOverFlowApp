//
//  OnBoardViewModel.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 22.07.2024.
//

import Foundation

final class OnBoardViewModel: ObservableObject {

    @Published var currentIndex: Int = 0
    @Published var isHomeRedirect: Bool = false
    private let cacheManager = DefaultCacheItems()

    // Check if the app is opened for the first time
    private func isFirstInit() -> Bool {
        return cacheManager.read(key: .onboard).isEmpty
    }

    func changeIsHomeRedirect(value: Bool) {
        isHomeRedirect = value
    }

    func chechUserFirstTime() {
        //        removeCacheFirstLogin()
        guard !isFirstInit() else {
            saveUserLoginAndRedirect()
            return
        }
        changeIsHomeRedirect(value: true)

    }

    func saveUserLoginAndRedirect() {
        let result = updateCacheFirstLogin()
        if result {
            changeIsHomeRedirect(value: true)
        }
        else {
            print("Error while saving user login status")
        }
    }

    private func updateCacheFirstLogin() -> Bool {
        return cacheManager.save(key: .onboard, value: "okay")
    }

    private func removeCacheFirstLogin() -> Bool {
        return cacheManager.remove(key: .onboard)
    }
}
