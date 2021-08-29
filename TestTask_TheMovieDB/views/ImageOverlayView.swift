//
//  ImageOverlay.swift
//  ImageOverlay
//
//  Created by kosmodev on 29.08.2021.
//

import SwiftUI

struct ImageOverlayView: View {
    var movie: Movie
    
    init(movie: Movie){
        self.movie = movie
    }
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(movie.title!)
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .padding(.leading, 5)

                    Text(daysBetween(startDate: movie.releaseDate!))
                        .font(.subheadline)
                        .foregroundColor(.blue).padding(.leading, 5)
                
    
            }
            .background(Color.black)
            .opacity(0.8)
            .layoutPriority(100)
        
            Spacer()
        }
    }
}
