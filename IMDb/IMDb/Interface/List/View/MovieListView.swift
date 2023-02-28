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
                     placement: .navigationBarDrawer(displayMode: .automatic),
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
        
        NavigationView {
            
            ScrollView {
                
                Image("imdb")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame( height: !isSearching ? 100 : 0, alignment: .init(horizontal: .center, vertical: .center))
                
                LazyVStack {
                    
                    ForEach(Array(viewModel.totalsearchResults.enumerated()), id: \.1.id) { (index, item) in
                        
                        NavigationLink (destination: IMDbDetailView(search: item)) {
                            
                        MovieView(search: item)
                            .padding(10)
                            .onAppear() {
                                viewModel.loadMoreIMDbList(currentItem: item)
                            }
                        }
                    }
                }.opacity(viewModel.totalsearchResults.isEmpty ? 0 : 1)
                 .padding(.top, -100)
                
                Spacer(minLength: 50)
                
                NoSearchResult()
                    .opacity(viewModel.totalsearchResults.isEmpty && isSearching ? 1 : 0)
                
               
                }
        }
    }
}

