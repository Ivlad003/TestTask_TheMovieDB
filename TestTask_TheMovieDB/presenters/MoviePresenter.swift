//
//  MoviePresenter.swift
//  MoviePresenter
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

class MoviePresenter: MoviesPresenterProtocol {
    private var service: MovieServicesProtocol
    private weak var delegate: MoviePresenterDelegate?
    private var viewMoviesPopular: [Movie] = []
    private var viewMoviesRated: [Movie] = []
    private var nextPagePopular: Int = 1
    private var topRatedError: Error?
    private var popularError: Error?
    
    init(delegate: MoviePresenterDelegate?) {
        self.service = MovieService()
        self.delegate = delegate
    }
    
    func fetchMovies() {
        let group = DispatchGroup()
        
        self.delegate?.renderLoading()
        
        group.enter()
        service.fetchMoviesTopRated(nextPage: 1) { pageWithMovies, error in
            if error != nil {
                self.topRatedError = error
            } else {
                if self.viewMoviesPopular.isEmpty {
                    self.viewMoviesRated.append(contentsOf: (pageWithMovies?.results ?? []))
                }
            }
            group.leave()
        }
        
        group.enter()
        service.fetchMoviesTopPopular(nextPage: nextPagePopular) { pageWithMovies, error in
            if error != nil {
                self.popularError = error
            } else {
                if self.viewMoviesPopular.isEmpty {
                    self.nextPagePopular = pageWithMovies?.page ?? 0 + 1
                    
                    self.viewMoviesPopular.append(contentsOf: (pageWithMovies?.results ?? []))
                }
            }
            
            group.leave()
        }
        
        group.notify(queue: .main) {
            DispatchQueue.main.async {
                if self.popularError != nil {
                    self.delegate?.render(errorMessage: self.popularError.debugDescription)
                } else if self.topRatedError != nil {
                    self.delegate?.render(errorMessage: self.topRatedError.debugDescription)
                } else {
                    self.delegate?.render(moviesRated: self.viewMoviesRated, moviesPopular: self.viewMoviesPopular)
                }
                
            }
        }
    }
    
    func searchMovies(searchQuery: String) {
        self.delegate?.renderLoading()
        service.searchMovies(searchQuery: searchQuery) { pageWithMovies, error in
            if error != nil {
                
            } else {
                DispatchQueue.main.async {
                    self.delegate?.render(moviesSearched: pageWithMovies?.results ?? [])
                    
                }
            }
        }
        
    }
    
    func clearPageIndex() {
        nextPagePopular = 1;
    }
}
