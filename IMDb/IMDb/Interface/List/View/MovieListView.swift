//
//  ContentView.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import SwiftUI

struct MoViewListView: View {
    
    @StateObject var viewModel = IMDbSearchViewModel()
    @State private var query: String = ""
   
    
    var body: some View  {
        
        NavigationView {
            
            MainView(viewModel: viewModel)
            .navigationTitle("Search IMDb")
        }
        
        .searchable( text: $query,
                     placement: .toolbar,
                     prompt: "Search IMDb"
        )
        .onSubmit(of: .search, runSearch)
        .onChange(of: query) { newQuery in

            viewModel.clearSearchResult()
            runSearch()
        }
    }
    
    func runSearch() {
        
        Task {
            await viewModel.fetchIMDbList(searchQuery: query)
        }
    }
}


struct MainView: View {
    
    @StateObject var viewModel: IMDbSearchViewModel
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(Array(viewModel.totalsearchResults.enumerated()), id: \.1.id) { (index, item) in
                    
                    
                    MovieView(search: item)
                        .padding(10)
                        .onAppear() {
                            viewModel.loadMoreIMDbList(currentItem: item)
                        }
                }
            }.opacity(viewModel.totalsearchResults.isEmpty ? 0 : 1)
            
            Spacer(minLength: 50)
            
            NoSearchResult()
                .opacity(viewModel.totalsearchResults.isEmpty && isSearching ? 1 : 0)
        }
    }
}

struct NoSearchResult: View {

    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
          
            VStack (alignment: .leading, spacing: 30) {
                Text("No Results")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Sorry, there are no results for \nthis search, Please try another phrase...")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.7)
                    
            }
            .padding(.horizontal, 70)
            .padding(.bottom, UIScreen.main.bounds.height * 0.1)
        }
    }
}
