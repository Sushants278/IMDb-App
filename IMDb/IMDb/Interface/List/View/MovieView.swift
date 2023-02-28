//
//  MovieView.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import SwiftUI

struct MovieView: View {
    
    //MARK: - PROPERTIES
     var search : Search
    
    var body: some View {
       
        HStack(spacing: 10) {
            
            VStack {
                
                AsyncImage(url: URL(string: search.poster)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    
                    Color.gray
                }
                .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading,spacing: 10) {
                
                Text(search.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(search.year)
                    .foregroundColor(.secondary)
            }
            
        }     .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)

    }
}
