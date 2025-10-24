//
//  SearchView.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//
import SwiftUI

struct SearchView: View {
    
    @State var text: String = ""
    var movieViewModel: MovieViewModel
    
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                if text.isEmpty {
                    Text("Your search results will be shown here.")
                        .foregroundStyle(.secondary)
                }
                else {
                    List(movieViewModel.searchFilm(for: text), id:\.id){ movie in
                        NavigationLink {
                            DetailsView(movie: movie)
                        } label: {
                            MovieView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Search Ghibli Movies")
            .searchable(text: $text)
            .task {
                await movieViewModel.getData()
            }
        }
    }
}

#Preview {
    SearchView(movieViewModel: MovieViewModel(shared: NetworkManager.shared))
}
