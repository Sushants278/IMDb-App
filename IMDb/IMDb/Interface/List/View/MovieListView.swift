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
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) private var dismissSearch

    var body: some View  {
        
        NavigationView {
            
            ScrollView {
                
                LazyVStack {
                    
                    ForEach(Array(viewModel.totalsearchResults.enumerated()), id: \.1.id) { (index, item) in
                        
                        MovieView(search: item)
                            .padding(10)
                            .onAppear() {
                                
                                viewModel.loadMoreIMDbList(currentItem: item)
                            }
                    }
                }
            }
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

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoViewListView()
    }
}

*/
