//
//  Common.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import UIKit

enum UserDefaultKeys: String {
    case authToken
}

struct StatusFail: Codable {
    let status: String?
    let error: FailError?
}

struct FailError: Codable {
    let message: FailErrorMessage?
}

struct FailErrorMessage: Codable {
    let email: String?
    let username: String?
    let token: String?
    let message: String?
}

func convertToDictionary(from text: String) throws -> [String: String] {
    if (text as NSString).contains("invalid_token") {
//        postNotification("tokenExpire", [:])
    }
    guard let data = text.data(using: .utf8) else { return [:] }
    let anyResult: Any = try JSONSerialization.jsonObject(with: data, options: [])
    return anyResult as? [String: String] ?? [:]
}

