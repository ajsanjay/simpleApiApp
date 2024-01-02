//
//  GetApptizerAPI.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import UIKit

struct GetApptizerAPI {
    
    private let cache = NSCache<NSString, UIImage>()
    
    func getApptizerList(completion: @escaping (requestKey?, ServiceError?) -> ()) {
        let request = GetApptizersRequest().getApptizers()
        APILoader.shared.loadAPIRequest(requestData: request) { (model: requestKey?, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                DispatchQueue.main.async {
                    completion(model, nil)
                }
            }
        }
    }
    
    func downloadImage(fromUrl: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: fromUrl)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: fromUrl) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
        
    }
    
}
