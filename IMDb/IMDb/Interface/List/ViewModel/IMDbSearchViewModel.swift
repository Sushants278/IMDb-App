//
//  IMDbSearchViewModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

class IMDbSearchViewModel: ObservableObject {
    
    @Published var searchResults: IMDbSeachResult?
    @Published var searchResults1: [Search] = []
    
    /// Load Giphy from API Server
    /// - Parameter loadMore: boolean for pagination call
    func fetchIMDbList(searchQuery: String) async {
    
            NetworkManager().fetchIMDbList(pageNumber: 1, searchQuery: searchQuery) { [weak self ] (searchResults, error) in
                
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    
                    self.searchResults = searchResults
                    self.searchResults1 =  searchResults?.search ?? []
                }
            }
    }
}
