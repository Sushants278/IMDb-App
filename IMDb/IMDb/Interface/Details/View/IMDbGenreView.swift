//
//  IMDbGenreView.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import SwiftUI

struct IMDbGenreView: View {
    
    
    var imdbDetail: IMDBDetail?
    
    var body: some View {
        // 1
        ScrollView(.horizontal) {
            
            HStack {
                // 2
                ForEach(imdbDetail?.genre?.components(separatedBy: ",") ?? [], id: \.self) { genre in
                    
                    getGenreView(genre: genre)
                }
            }
        }
    }
    
    func getGenreView(genre: String) -> some View {
        
        return ZStack {
            
            Text(genre)
                .font(.system(size: 10, weight: .heavy, design: .default))
                .padding(4)
                .foregroundColor(.primary)
        }.background(Color.gray)
            .opacity(0.8)
            .padding(.leading, 6)
    }
}
