//
//  MovieViewModel.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//
import SwiftUI

@Observable
class MovieViewModel {
    var movies: [Movies] = []
    var shared: NetworkManager
    
    init(shared: NetworkManager) {
        self.shared = shared
    }
    
    @MainActor
    func getData() async {
        movies = await shared.getDataFromServer(url: Constants.endPoint)
    }
    
    func searchFilm(for searchTerm: String) -> [Movies] {
        guard !searchTerm.isEmpty else { return [] }
        return movies.filter { movie in
            guard let title = movie.title else { return false }
            return title.localizedStandardContains(searchTerm)
        }
    }
}
