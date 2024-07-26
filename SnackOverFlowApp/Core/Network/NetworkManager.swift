//
//  NetworkManager.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 23.07.2024.
//

import Alamofire
import Foundation

struct NetworkConfig {
    let baseUrl: String
}

protocol INetworkManager {
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T?
    var config: NetworkConfig { get set }
}

extension NetworkManager {
    static let networkManager: INetworkManager = NetworkManager(
        config: NetworkConfig(baseUrl: NetworkPath.baseUrlReqres)
    )
}

final class NetworkManager: INetworkManager {
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T? {

        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(model) else { return nil }
        guard let dataString = String(data: data, encoding: .utf8) else { return nil }
        let request =
            AF.request(
                "\(config.baseUrl)\(path.rawValue)",
                method: .post,
                parameters: convertToDictionary(text: dataString)
            )
            .validate().serializingDecodable(T.self)
        let result = await request.response
        if result.error != nil {
            print("Network ERROR : \(result.error!)")
        }

        return result.value
    }

    init(config: NetworkConfig) {
        self.config = config
    }

    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T? {
        let request = AF.request("\(config.baseUrl)\(path.rawValue)", method: method).validate()
            .serializingDecodable(T.self)

        let result = await request.response

        if result.error != nil {
            print("Network ERROR : \(result.error!)")
        }

        return result.value
    }

    internal var config: NetworkConfig

    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            }
            catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

}

enum NetworkPath: String {
    case users = "api/users"
    case login = "api/login"

    static let baseUrlReqres: String = "https://reqres.in/"
}
