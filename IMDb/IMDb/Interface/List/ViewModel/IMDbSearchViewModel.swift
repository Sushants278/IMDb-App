//
//  IMDbSearchViewModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

class IMDbSearchViewModel: ObservableObject {
    
    
    /// Load Giphy from API Server
    /// - Parameter loadMore: boolean for pagination call
    func fetchIMDbList(loadMore: Bool) {
        
        
        NetworkManager().fetchIMDbList(pageNumber: 1, loadMore: false) { [weak self ] (searchResults, error) in
            
            guard let self = self else { return }
            
            print(searchResults)
        }
    }
}
