//
//  MoviesPopularView.swift
//  MoviesPopularView
//
//  Created by kosmodev on 29.08.2021.
//

import SwiftUI

struct MoviesListView: View {
    
    var movies: [Movie]
    
    init(movies: [Movie]){
        self.movies = movies
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(self.movies) { result in
                    VStack(alignment: .leading, spacing: 5) {
                        if let backdropPath = result.backdropPath {
                            if #available(iOS 15.0, *) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath)"),
                                           content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                },
                                           placeholder: {
                                    ProgressView()
                                })
                            }
                        }
                        
                        Text(result.originalTitle!)
                            .font(.title)
                            .foregroundColor(.blue)
                        
                        Text(result.overview!)
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                        
                        Text(daysBetween(startDate: result.releaseDate ?? ""))
                            .font(.caption)
                        .foregroundColor(.gray)}
                }}
        }
    }
}
