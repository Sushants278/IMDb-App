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
                
                HStack(spacing: 10) {
                    
                    VStack {
                        
                        AsyncImage(url: URL(string: item.poster)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        } placeholder: {
                            
                            Color.gray
                            
                        }
                        .frame(width: 100, height: 80)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text(item.title)
                            .font(.headline)
                        Text(item.year)
                            .foregroundColor(.secondary)
                    }
                    
                }.padding(10)
                
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

/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoViewListView()
    }
}

*/
