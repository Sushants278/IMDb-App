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
    var body: some View {
        
        NavigationView {
           Text("Hello")
        }
        .searchable(text: $query,
                    placement: .automatic)
        .navigationBarTitle("IMDb Results").onAppear {
            
            viewModel.fetchIMDbList(loadMore: false)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoViewListView()
    }
}
