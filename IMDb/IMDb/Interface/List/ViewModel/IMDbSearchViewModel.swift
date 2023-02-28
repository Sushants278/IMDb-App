//
//  IMDbSearchViewModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

class IMDbSearchViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var searchResults: IMDbSeachResult?
    @Published var totalsearchResults: [Search] = []
    var page : Int = 1
    var lastSearchedText: String = ""
    
    /// Load IMDb List from API Server
    /// - Parameter searchQuery: searchQuery to search the IMDb
    func fetchIMDbList(searchQuery: String) async {
        
        guard searchQuery.count > 2 else {
            
            return
        }
        
        NetworkManager().fetchIMDbList(pageNumber: page, searchQuery: searchQuery) { [weak self ] (searchResults, error) in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                self.lastSearchedText = searchQuery
                self.searchResults = searchResults
                self.totalsearchResults.append(contentsOf: searchResults?.search ?? [])
            }
        }
    }
    
    /// This is pagination call to load the more Item
    /// - Parameter item: last searched Item
    func loadMoreIMDbList( currentItem item: Search) {
       
        if item.id == self.searchResults?.search.last?.id && self.searchResults?.totalResults.count ?? 0 <= totalsearchResults.count {
            page += 1
            Task {
                
                await self.fetchIMDbList(searchQuery: self.lastSearchedText)
            }
         }
    }
    
    /// Clear all the static stored states once user cancel or clear the search
    func clearSearchResult() {
        
        self.totalsearchResults = []
        self.searchResults = nil
        self.lastSearchedText = ""
        self.page = 1
    }
}
