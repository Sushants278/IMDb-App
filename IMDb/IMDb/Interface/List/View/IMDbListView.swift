//
//  ContentView.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import SwiftUI

struct IMDbListView: View {
    
    //MARK: - PROPERTIES
    @StateObject var viewModel = IMDbSearchViewModel()
    @State private var query: String = ""
    
    
    //MARK: - View Life Cycle
    var body: some View  {
        
        NavigationView {
            
            MainView(viewModel: viewModel)
                .navigationTitle(Identifiers.searchTitle)
               
        }
        .searchable( text: $query,
                     placement: .navigationBarDrawer(displayMode: .automatic),
                     prompt: Identifiers.searchTitle
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
                
                Image(Identifiers.imdbImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame( height: !isSearching ? 100 : 0, alignment: .init(horizontal: .center, vertical: .center))
                
                LazyVStack {
                    
                    ForEach(viewModel.totalsearchResults, id: \.self) { item in
                        
                        NavigationLink (destination: IMDbDetailView(search: item)) {
                            
                            IMDbView(search: item)
                                .padding(10)
                                .onAppear() {
                                    viewModel.loadMoreIMDbList(currentItem: item)
                                }
                        }
                    }
                }.opacity(viewModel.totalsearchResults.isEmpty ? 0 : 1)
                    .padding(.top, -50)
                
                Spacer(minLength: 50)
                
                IMDbNoSearchResult()
                    .opacity(viewModel.totalsearchResults.isEmpty && isSearching ? 1 : 0)
            }
        }
    }
}

