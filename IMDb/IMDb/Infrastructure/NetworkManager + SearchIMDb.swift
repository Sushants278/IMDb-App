//
//  NetworkManager + SearchIMDb.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation


typealias IMDbListCompletionClosure = ((IMDbSeachResult?, Error?) -> Void)

protocol IMDbListRequests {
    
    func fetchIMDbList(pageNumber: Int, searchQuery: String, handler: @escaping IMDbListCompletionClosure)
}

extension NetworkManager: IMDbListRequests {
    
    
    /// Gets the array of IMDb associated with Ednpoint
    /// - Parameters:
    ///   - pageNumber: pagination index
    ///   - searchQuery: search Text
    ///   - handler: Callback after execution the request
    func fetchIMDbList(pageNumber: Int, searchQuery: String, handler: @escaping IMDbListCompletionClosure) {
        
        var urlComponents = self.urlComponents
        urlComponents.queryItems?.append(URLQueryItem(name: "s", value: searchQuery))
        urlComponents.queryItems?.append(URLQueryItem(name: "page", value:  String(pageNumber)))
        
        guard let url = urlComponents.url else {
            
            handler(nil, NetworkError.invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        executeRequest(request: request, completion: handler)
    }
}
    
