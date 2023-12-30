//
//  GetApptizersRequest.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import Foundation

struct GetApptizersRequest: RequestHandler {
    
    func getApptizers() -> URLRequest? {
        let urlString =  APIPath.apptizers
        if let url = URL(string: urlString) {
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
}
