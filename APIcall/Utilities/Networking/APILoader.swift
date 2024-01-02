//
//  APILoader.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import SwiftUI

struct APILoader: ResponseHandler {
    static let shared = APILoader()
    var urlSession: URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadAPIRequest<C:Codable>(requestData: URLRequest?, completionHandler: @escaping (C?, ServiceError?) -> ()) {
        if var urlRequest = requestData {
            //Set Auth token
            if let auth_token = UserDefaults.standard.string(forKey: UserDefaultKeys.authToken.rawValue) {
               urlRequest.setValue("Bearer \(auth_token)", forHTTPHeaderField: "Authorization")
            }
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    guard error == nil else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Error occured")", statusFailedError: nil))
                        return
                    }
                    guard let responseData = data else {
                        completionHandler(nil, ServiceError(httpStatus: httpResponse.statusCode, message: "ServiceError : \(error?.localizedDescription ?? "Data not found")", statusFailedError: nil))
                        return
                    }
                    print("Response --- \(String(describing: requestData?.url)) Response \(String(describing: response)) \(String(describing: try? JSONSerialization.jsonObject(with: responseData, options: [])))")
                    do {
                        let parsedResponse:C = try parseResponse(data: responseData, response: httpResponse)
                         completionHandler(parsedResponse, nil)
                    } catch let error {
                        guard let serviceError = error as? ServiceError else {
                            completionHandler(nil, nil)
                            return
                        }
                        if serviceError.httpStatus != 403 {
                            if let httpResponse = response as? HTTPURLResponse {
                                guard let headers = httpResponse.allHeaderFields as NSDictionary? as! [String:String]? else {
                                    return
                                }
                                do {
                                    let dictionary = try convertToDictionary(from: headers["Www-Authenticate"] ?? "")
                                    print(dictionary)
                                } catch {
                                    print(error)
                                }
                            }
                        }
                        if let _ = serviceError.statusFailedError?.error?.message?.token , serviceError.httpStatus == 1000 {
//                            postNotification("tokenExpire", [:])
                        } else {
                            completionHandler(nil, serviceError)
                        }
                    }
                }
            }.resume()
        }
    }
    
}
