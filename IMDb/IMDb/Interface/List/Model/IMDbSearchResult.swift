//
//  IMDbSearchResult.swift
//  IMDb
//
//  Created by Sushant Shinde on 27/02/23.
//

import Foundation

// MARK: - IMDB
struct IMDbSeachResult: Codable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable, Hashable {
    
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String
    let id =  UUID()
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
    case game = "game"
}
