//
//  MoviesPresenterProtocol.swift
//  MoviesPresenterProtocol
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

protocol MoviesPresenterProtocol: AnyObject {
    func fetchMovies()
    func searchMovies(searchQuery: String)
}
