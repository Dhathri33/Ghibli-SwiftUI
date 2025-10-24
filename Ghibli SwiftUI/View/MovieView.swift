//
//  MovieView.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//

import SwiftUI

struct MovieView: View {
    var movie: Movies
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: movie.image ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 90, height: 140)
            VStack(alignment: .leading){
                Text(movie.title ?? "")
                    .font(.headline)
                Text("Directed by \(movie.director ?? "")")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("Released: \(movie.release_date ?? "")")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}


