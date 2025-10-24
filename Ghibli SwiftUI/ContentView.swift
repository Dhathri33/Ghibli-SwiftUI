//
//  ContentView.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Movies", systemImage: "movieclapper") {
                MovieListView(movieViewModel: MovieViewModel(shared: NetworkManager.shared))
            }
            Tab("Favorites", systemImage: "heart") {
                
            }
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
