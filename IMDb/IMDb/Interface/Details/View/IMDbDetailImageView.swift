//
//  IMDbDetailImageView.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import SwiftUI

struct IMDbDetailImageView: View {
    
    //MARK: - PROPERTIES
    var imdbDetail: IMDBDetail?
    
    //MARK: - View Life Cycle
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: imdbDetail?.poster ?? "")) { image in
                
                image
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: UIScreen.main.bounds.width - 30,
                        height: 250
                    )
                
            } placeholder: {
                
                Color.gray
            }.overlay(ImageOverlay(imdbDetail: imdbDetail), alignment: .bottomLeading)
                .overlay(alignment: .topTrailing) {
                    
                    HStack {
                        
                        ZStack {
                            Text(Identifiers.imdbRating)
                                .font(.system(size: 11, weight: .heavy, design: .default))
                                .padding(4)
                                .foregroundColor(.black)
                        }.background(Color.yellow)
                            .opacity(0.8)
                            .padding(.leading, 6)
                        
                        Text(imdbDetail?.imdbRating ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 12.0, weight: .heavy))
                    }.padding(10)

                }
        }
        .background(Color.black)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
    
    }
}

struct ImageOverlay: View {
    
    var imdbDetail: IMDBDetail?
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading) {
                
                Text(Identifiers.year + (imdbDetail?.year ?? ""))
                    .foregroundColor(.white)
                    .font(.system(size: 11, weight: .heavy, design: .default))
                    .padding(.leading, 5)
            }
        }
        .cornerRadius(10.0)
        .padding(15)
    }
}
