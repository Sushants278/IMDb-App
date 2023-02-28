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
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                //ImageView
                IMDbDetailImageView(imdbDetail: viewModel.imdbDetails)
                
                //Title
                Text(viewModel.imdbDetails?.title ?? "")
                    .font(.bold(.title2)())
                    .padding(.top, 20)
                
                //GenreView
                IMDbGenreView(imdbDetail: viewModel.imdbDetails)
                    .padding(.top, 20)
                
                //PlotView
                IMDbPlotView(imdbDetail: viewModel.imdbDetails)
                
                Spacer()
                
            }.padding(.horizontal, 20)
            
                .onAppear() {
                    
                    Task {
                        
                        await viewModel.fetchIMDbDetails(for: search.imdbID)
                    }
                }
        }
    }
}

