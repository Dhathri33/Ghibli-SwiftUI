//
//  DetailsView.swift
//  Ghibli SwiftUI
//
//  Created by Dhathri Bathini on 10/24/25.
//
import SwiftUI

struct DetailsView: View {
    var movie: Movies
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: movie.movie_banner ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                }
                placeholder: {
                    ProgressView()
                }
                .frame(width:400, height: 300)
                MovieInfo(movie: movie)
                Divider()
                Text("Description")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.leading)
                Text(movie.description ?? "")
                    .padding(.leading)
                Spacer()
            }
        }
    }
}

struct MovieInfo: View {
    var movie: Movies
    var body: some View {
        Text(movie.title ?? "")
            .font(.title)
            .padding(.leading)
            .fontWeight(.semibold)
        HStack {
            VStack(alignment: .leading){
                Text("Director")
                Text("Producer")
                Text("Release Date")
                Text("Running Time")
                Text("Score")
            }
            .font(.subheadline)
            .fontWeight(.medium)
            VStack(alignment: .leading){
                Text(movie.director ?? "")
                Text(movie.producer ?? "")
                Text(movie.release_date ?? "")
                Text("\(movie.running_time ?? "") minutes")
                Text("\(movie.rt_score ?? "")/100")
            }
            .font(.subheadline)
            Spacer()
        }
        .padding(.leading)
    }
}
