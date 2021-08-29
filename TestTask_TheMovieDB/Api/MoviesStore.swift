//
//  MoviesStore.swift
//  MoviesStore
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

class MoviesStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(moviesRated: [Movie], moviesPopular: [Movie])
    }
    
    enum StateSearch {
        case none
        case loading
        case error(message: String)
        case loaded(moviesSearched: [Movie])
    }
    
    @Published var state: State = .loading
    @Published var stateSearch: StateSearch = .none
}

extension MoviesStore: MoviePresenterDelegate {
    func render(moviesSearched: [Movie]) {
        self.stateSearch = StateSearch.loaded(moviesSearched: moviesSearched)
    }
    
    func render(moviesRated: [Movie], moviesPopular: [Movie]) {
        self.state = .loaded(moviesRated: moviesRated, moviesPopular: moviesPopular)
    }
    
    func render(errorMessage: String) {
        self.state = .error(message: errorMessage)
    }
    
    func renderLoading() {
        self.state = .loading
        self.stateSearch = .loading
    }
}
