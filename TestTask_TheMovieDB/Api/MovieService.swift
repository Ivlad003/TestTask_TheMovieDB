//
//  MovieService.swift
//  MovieService
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

class MovieService: MovieServicesProtocol {
    let host = "https://api.themoviedb.org/3/"
    let apiKey = "f910e2224b142497cc05444043cc8aa4"
    
    func fetchMoviesTopRated(nextPage: Int, completion: @escaping (PageWithMovies?, Error?) -> Void) {
        sendRequest("\(self.host)movie/top_rated", parameters: [
                        "page": String(nextPage),
                        "api_key": apiKey], completion: completion)
    }
    
    func fetchMoviesTopPopular(nextPage: Int, completion: @escaping (PageWithMovies?, Error?) -> Void) {
        sendRequest("\(self.host)movie/popular", parameters: [
                        "page": String(nextPage),
                        "api_key": apiKey], completion: completion)
    }
    
    func searchMovies(searchQuery: String, completion: @escaping (PageWithMovies?, Error?) -> Void) {
        sendRequest("\(self.host)search/movie", parameters: [
                        "query": searchQuery,
                        "api_key": apiKey], completion: completion)
    }
}
