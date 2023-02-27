//
//  ContentView.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import SwiftUI

struct MoViewListView: View {
    
    @State private var query: String = ""
    var body: some View {
        
        NavigationView {
           Text("Hello")
        }
        .searchable(text: $query,
                    placement: .automatic)
        .navigationBarTitle("IMDb Results")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoViewListView()
    }
}
