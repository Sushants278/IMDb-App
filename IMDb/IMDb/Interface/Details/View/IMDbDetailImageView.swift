//
//  IMDbDetailImageView.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import SwiftUI

struct IMDbDetailImageView: View {
    
    var imdbDetail: IMDBDetail?
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: "https://www.indiewire.com/wp-content/uploads/2021/01/joker-movie.jpg")) { image in
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                
                Color.gray
            }.overlay(ImageOverlay(), alignment: .bottomLeading)
        }
        .background(Color.pink)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
        .frame(
            width: UIScreen.main.bounds.width - 30,
            height: 250
        )
    }
}
