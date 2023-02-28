//
//  IMDbDetailView.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import SwiftUI

struct IMDbDetailView: View {
    
    var search : Search
    @StateObject var viewModel = IMDbDetailViewModel()
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear() {
                
                Task {
                    
                    await viewModel.fetchIMDbDetails(for: search.imdbID)
                }
            }
    }
}

