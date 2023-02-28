//
//  NetworkManager + IMDbDetails.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

typealias IMDbDetailCompletionClosure = ((IMDBDetail?, Error?) -> Void)


protocol IMDbDetailsRequests {
    
    func fetchIMDbDetails(for movieID: String, handler: @escaping IMDbDetailCompletionClosure)
}

extension NetworkManager: IMDbDetailsRequests {
    
    func fetchIMDbDetails(for movieID: String, handler: @escaping IMDbDetailCompletionClosure) {
        
        var urlComponents = self.urlComponents
        urlComponents.queryItems?.append(URLQueryItem(name: "i", value: movieID))
        urlComponents.queryItems?.append(URLQueryItem(name: "plot", value:  "full"))
        
        guard let url = urlComponents.url else {
            
            handler(nil, NetworkError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        executeRequest(request: request, completion: handler)
    }
}
