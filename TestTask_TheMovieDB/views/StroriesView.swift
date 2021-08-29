//
//  StroriesView.swift
//  TheMovieDB_TestTask
//
//  Created by kosmodev on 28.08.2021.
//

import SwiftUI



struct StroriesView: View {
    var presenter: MoviesPresenterProtocol
    @ObservedObject var store: MoviesStore
    
    init() {
        let store = MoviesStore()
        self.store = store
        self.presenter = MoviePresenter(delegate: store)
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            switch store.state {
            case .loading:
                Text("Loading...")
                ProgressView()
            case .error(let message):
                Text(message).foregroundColor(.red)
            case .loaded(let moviesRated, let moviesPopular):

                NavigationLink(destination: SearchView()) {
                    Image(systemName: "doc.text.magnifyingglass")
                    Text("Search Page")
                }.padding(10)
                
                MoviesRatedView(moviesRated: moviesRated)
                
                MoviesListView(movies: moviesPopular)
            }
               
        }.onAppear(perform: presenter.fetchMovies)
    };
}

struct StroriesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StroriesView()
        }
    }
}
