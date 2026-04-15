//
//  HomeDetailList.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 13/04/26.
//

import SwiftUI

struct HomeDetailList: View {
    let movie: HomeMovieModel

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottom) {
                imageBanner
                    .frame(height: 250)
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .overlay(
                        Color.black.opacity(1)
                    )
                    .frame(height: 90)
                    .mask(
                        LinearGradient(
                            colors: [.clear, .black],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }

            VStack {
                textMovieTitle

                HStack(alignment: .top) {
                    imageMovie
                    textMovieDescriptions
                }

                HStack {
                    directorText
                    Spacer()
                    producerText
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
            }
            .padding(.horizontal, 16)

        }
        .ignoresSafeArea(edges: .top)
        .background(Color.black)
    }

    var imageBanner: some View {
        AsyncImage(url: URL(string: movie.imageBanner)) { image in
            image
                .resizable()
                .scaledToFill()
                .clipped()
        } placeholder: {
            ProgressView()
        }
    }

    var imageMovie: some View {
        AsyncImage(url: URL(string: movie.image)) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(4)
        } placeholder: {
            ProgressView()
        }
    }

    var textMovieTitle: some View {
        Text(movie.title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
    }

    var textMovieDescriptions: some View {
        VStack(alignment: .leading) {

            HStack {
                Text(movie.releaseDate)
                Text("●")
                Text("\(movie.runningTime) min")
                Text("●")
                Text("Anime")
            }
            .font(.subheadline)
            .foregroundStyle(Color.gray)
            .padding(.bottom, 4)

            Text(movie.description)
                .font(.body)
                .lineSpacing(4)
                .foregroundStyle(Color.gray.opacity(0.8))
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, 4)
    }

    var directorText: some View {
        VStack(alignment: .leading) {
            Text("Director")
            Text(movie.director)
        }
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundStyle(Color.white)
    }

    var producerText: some View {
        VStack(alignment: .leading) {
            Text("Producer")
            Text(movie.producer)
        }
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundStyle(Color.white)
    }
}
