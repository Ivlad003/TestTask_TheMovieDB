//
//  SearchView.swift
//  SearchView
//
//  Created by kosmodev on 29.08.2021.
//

import SwiftUI

struct SearchView: View {
    var presenter: MoviesPresenterProtocol
    @ObservedObject var store: MoviesStore
    @State var searchText: String = ""
    
    init() {
        let store = MoviesStore()
        self.store = store
        self.presenter = MoviePresenter(delegate: store)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            SearchBarView(text: $searchText)
                .onChange(of: searchText) { value in
                    self.presenter.searchMovies(searchQuery: searchText)
                }
            Spacer()
                switch store.stateSearch {
                case .none:
                    EmptyView()
                case .loading:
                    Text("Loading...")
                    ProgressView()
                case .error(let message):
                    Text(message).foregroundColor(.red)
                case .loaded(let moviesSearched):
                    MoviesListView(movies: moviesSearched)
                }
            Spacer()
            
        }.padding()

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
