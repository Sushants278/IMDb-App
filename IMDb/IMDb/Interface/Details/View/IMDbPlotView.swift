//
//  IMDbPlotView.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import SwiftUI

struct IMDbPlotView: View {
    
    //MARK: - PROPERTIES
    @State var isExpanded = false
    var imdbDetail: IMDBDetail?
    
    //MARK: - View Life Cycle
    var body: some View {
        
        Text(Identifiers.plot)
            .font(.system(size: 15, weight: .heavy, design: .default))
            .padding(.top, 20)
        
        Text(imdbDetail?.plot ?? "")
            .lineLimit(isExpanded ? .max : 6)
            .padding(.top, 5)
            .font(.system(size: 15, weight: .regular, design: .serif))
        
        Button{
            
            withAnimation {
                
                if !isExpanded {
                    
                    isExpanded.toggle()
                }
            }
            
        } label: {
            Text(Identifiers.readMore)
                .frame(width: 100, height: 40)
                .padding(.leading ,-20)
                .font(.system(size: 15, weight: .heavy, design: .default))
            
        }.frame(width: 100, height: 40)
         .opacity(isExpanded ? 0 : 1)
    }
}


