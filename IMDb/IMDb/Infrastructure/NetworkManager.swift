//
//  NetworkManager.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

enum NetworkError: Error {
    
    case invalidUrl
    case invalidData
}

class NetworkManager {
    
    func executeRequest<T: Codable>(request: URLRequest, completion: ((T?, Error?) -> Void)?) {
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion?(nil, error)
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    
                    completion?(decodedResponse, nil)
                }
            } else {
                completion?(nil, NetworkError.invalidData)
            }
            
        }
        dataTask.resume()
    }
}
