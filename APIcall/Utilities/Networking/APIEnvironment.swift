//
//  APIEnvironment.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import Foundation

enum APIEnvironment {
    
    case development
    case production
    
    func baseURL (route: APIroute) -> String {
        return "https://\(domain())"
        //+"\(route.route())"
    }

    func domain() -> String {
        return self == .development ? "seanallen-course-backend.herokuapp.com/swiftui-fundamentals" : "seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    }
    
    enum APIroute {
        case v1
        case v2
        case v3
        case v4
        func route() -> String {
            switch self {
            case .v1:
                return "/v1"
            case .v2:
                return "/v2"
            case .v3:
                return "/v3"
            case .v4:
                return "/v4"
            }
        }
    }
}
