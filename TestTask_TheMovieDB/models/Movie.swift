//
//  Movie.swift
//  Movie
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let posterPath: String?
    let adult: Bool?
    let overview, releaseDate: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle: String?
    let originalLanguage: String?
    let title: String?
    let backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?
}
