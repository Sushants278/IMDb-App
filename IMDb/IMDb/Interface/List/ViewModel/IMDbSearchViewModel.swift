//
//  IMDbSearchViewModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

class IMDbSearchViewModel: ObservableObject {
    
    @Published var searchResults: IMDbSeachResult?
    @Published var totalsearchResults: [Search] = []
    var page : Int = 1
    var lastSearchedText: String = ""
    
    /// Load Giphy from API Server
    /// - Parameter loadMore: boolean for pagination call
    func fetchIMDbList(searchQuery: String) async {
    
            NetworkManager().fetchIMDbList(pageNumber: page, searchQuery: searchQuery) { [weak self ] (searchResults, error) in
                
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    
                    self.lastSearchedText = searchQuery
                    self.searchResults = searchResults
                    self.totalsearchResults.append(contentsOf: searchResults?.search ?? [])
                }
            }
    }
    
    //MARK: - PAGINATION
    
    func loadMoreIMDbList( currentItem item: Search) {
       
        if item.id == self.searchResults?.search.last?.id && self.searchResults?.totalResults.count ?? 0 <= totalsearchResults.count {
            
            page += 1
            
            Task {
                
                await self.fetchIMDbList(searchQuery: self.lastSearchedText)
            }
         }
    }
    
    func clearSearchResult() {
        
        self.totalsearchResults = []
        self.searchResults = nil
        self.lastSearchedText = ""
        self.page = 1
    }
}
