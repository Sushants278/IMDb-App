//
//  NoSearchResult.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import SwiftUI

struct IMDbNoSearchResult: View {

    var body: some View {
        ZStack (alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
          
            VStack (alignment: .leading, spacing: 30) {
                Text(Identifiers.noResults)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(Identifiers.noResultMessage)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.7)
                    
            }
            .padding(.horizontal, 70)
            .padding(.bottom, UIScreen.main.bounds.height * 0.1)
        }
    }
}
