//
//  IMDbDetailViewModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import Foundation

class IMDbDetailViewModel: ObservableObject {
    
    @Published var imdbDetails: IMDBDetail?
    @Published var isLoading = true
    
    /// Load Giphy from API Server
    /// - Parameter loadMore: boolean for pagination call
    func fetchIMDbDetails(for moviewID: String) async {
        
        NetworkManager().fetchIMDbDetails(for: moviewID) { [weak self ] imdbDetails, error in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                
                self.imdbDetails = imdbDetails
                self.isLoading.toggle()
            }
        }
    }
}
