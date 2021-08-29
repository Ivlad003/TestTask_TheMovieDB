//
//  PageWithMovies.swift
//  PageWithMovies
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

struct PageWithMovies: Decodable {
    let page: Int?
    let results: [Movie]?
    let totalResults, totalPages: Int?
}
