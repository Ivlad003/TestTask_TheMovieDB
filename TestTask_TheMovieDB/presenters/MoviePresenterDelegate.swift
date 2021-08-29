//
//  MoviePresenterDelegate.swift
//  MoviePresenterDelegate
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

protocol MoviePresenterDelegate: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func render(moviesRated: [Movie], moviesPopular: [Movie])
    func render(moviesSearched: [Movie])
}
