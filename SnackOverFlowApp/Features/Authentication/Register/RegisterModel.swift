//
//  RegisterModel.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 23.07.2024.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? JSONDecoder().decode(LoginModel.self, from: jsonData)



// MARK: - LoginRequest
struct LoginRequest: Encodable {
    let email, password: String?
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: jsonData)


// MARK: - LoginResponse
struct LoginResponse: Codable {
    let token: String?
}


