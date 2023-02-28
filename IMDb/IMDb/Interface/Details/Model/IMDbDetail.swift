//
//  IMDbDetailModel.swift
//  IMDb
//
//  Created by Sushant Shinde on 28/02/23.
//

import Foundation


// MARK: - IMDBDetail
struct IMDBDetail: Codable, Identifiable {
    
    let id = UUID()
    let title, year, rated, released: String?
    let runtime, genre, director, writer: String?
    let actors, plot, language, country: String?
    let awards: String?
    let poster: String?
    let ratings: [Rating]
    let metascore, imdbRating, imdbVotes, imdbID: String?
    let type, dvd, boxOffice, production: String?
    let website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}


import SwiftUI


struct GenreView: View {
    
    let nums = [1, 2, 3,4,5]
    
    var body: some View {
        // 1
        ScrollView(.horizontal) {
            
            HStack {
                // 2
                ForEach(0...5, id: \.self) { index in
                    
                    getGenreView()
                }
            }
        }
    }
    
    func getGenreView() -> some View {
        
        return ZStack {
            Text("IMDb")
                .font(.system(size: 10, weight: .heavy, design: .default))
                .padding(4)
                .foregroundColor(.white)
        }.background(Color.gray)
            .opacity(0.8)
            .padding(.leading, 6)
        
    }
}
