//
//  IMDbDetailViewModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import Foundation

class IMDbDetailViewModel: ObservableObject {
    
    //MARK: - PROPERTIES
    @Published var imdbDetails: IMDBDetail?
    @Published var isLoading = true
    
    /// get IMDB detials from API Server for selected ID
    /// - Parameter moviewID: imdbID or moviewID to get the details
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
