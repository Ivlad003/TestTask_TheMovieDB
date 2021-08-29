//
//  MovieServicesProtocol.swift
//  TheMovieDB_TestTask
//
//  Created by kosmodev on 26.08.2021.
//

import Foundation
import SwiftUI

protocol MovieServicesProtocol: AnyObject {
    func fetchMoviesTopRated(nextPage: Int, completion: @escaping (PageWithMovies?, Error?) -> Void)
    func fetchMoviesTopPopular(nextPage: Int, completion: @escaping (PageWithMovies?, Error?) -> Void)
    func searchMovies(searchQuery: String, completion: @escaping (PageWithMovies?, Error?) -> Void)
}
