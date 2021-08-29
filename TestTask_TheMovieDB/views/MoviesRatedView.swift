//
//  MoviesRatedView.swift
//  MoviesRatedView
//
//  Created by kosmodev on 29.08.2021.
//

import SwiftUI

struct MoviesRatedView: View {
    
    var moviesRated: [Movie]
    
    init(moviesRated: [Movie]){
        self.moviesRated = moviesRated
    }
    
    var body: some View {
        TabView {
            ForEach(self.moviesRated) { result in
                VStack {
                    if let backdropPath = result.backdropPath {
                        if #available(iOS 15.0, *) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath)"),
                                       content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            },
                                       placeholder: {
                                ProgressView()
                            }).overlay(ImageOverlayView(movie: result), alignment: .topLeading)
                        }
                    }
                }
                
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
    }
}
