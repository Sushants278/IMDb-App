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
            
            List(viewModel.searchResults1) { item in
                
                VStack(alignment: .leading) {
                    
                    Text(item.title)
                        .font(.headline)
                    Text(item.poster)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Search IMDb")
        }
        
        .searchable( text: $query,
                    placement: .toolbar
                )
        .onChange(of: query) { newQuery in
            
            Task { await viewModel.fetchIMDbList(searchQuery: query)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoViewListView()
    }
}

