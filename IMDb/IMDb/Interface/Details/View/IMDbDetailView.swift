//
//  IMDbDetailView.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import SwiftUI

struct IMDbDetailView: View {
    
    //MARK: - PROPERTIES
    var search : Search
    @StateObject var viewModel = IMDbDetailViewModel()

    //MARK: - View Life Cycle
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
                    .opacity(viewModel.isLoading ? 0 : 1)
                    .overlay(content: {
                        
                        if viewModel.isLoading {
                            
                            ProgressView(Identifiers.progress)
                                .tint(.orange)
                                .foregroundColor(.gray)
                        }
                    })
                    .onAppear() {
                        
                        Task {
                            
                            await viewModel.fetchIMDbDetails(for: search.imdbID)
                        }
                    }
            }
    }
}

