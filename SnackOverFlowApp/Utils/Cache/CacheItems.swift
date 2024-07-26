//
//  CacheItems.swift
//  SnackOverFlowApp
//
//  Created by Emre Simsek on 22.07.2024.
//

import Foundation

enum CacheKeys: String {
    case onboard = "onboard"
}

protocol ICacheItems {
    func read(key: CacheKeys) -> String
    func save(key: CacheKeys, value: String) -> Bool
    func remove(key: CacheKeys) -> Bool
}

extension ICacheItems {
    func read(key: CacheKeys) -> String {

        guard let value = UserDefaults.standard.value(forKey: key.rawValue) as? String else {
            return ""
        }
        return value
    }

    func save(key: CacheKeys, value: String) -> Bool {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
        return true
    }

    func remove(key: CacheKeys) -> Bool {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        return true
    }
}

struct DefaultCacheItems: ICacheItems {

}
