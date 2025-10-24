//
//  MovieListView.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//
import SwiftUI

struct MovieListView: View {
    
    var movieViewModel: MovieViewModel
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
    }
    
    var body: some View {
        NavigationStack {
            List(movieViewModel.movies, id: \.id) { movie in
                NavigationLink {
                    DetailsView(movie: movie)
                } label: {
                    MovieView(movie: movie)
                }
            }
            .task {
                await movieViewModel.getData()
            }
            .navigationTitle("Ghibli Movies")
        }
    }
}

#Preview {
    MovieListView(movieViewModel: MovieViewModel(shared: NetworkManager.shared))
}
