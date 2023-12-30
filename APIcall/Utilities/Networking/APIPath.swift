//
//  APIPath.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import Foundation

//#if DEBUG
let environment = APIEnvironment.development
//#else
//let environment = APIEnvironment.production
//#endif

struct APIPath {
    //Sign
    static var apptizers: String { return "\(environment.baseURL(route: .v1))/appetizers"}
}

enum ServerStatus: String {
    case Success = "Success"
    case fail = "fail"
}

