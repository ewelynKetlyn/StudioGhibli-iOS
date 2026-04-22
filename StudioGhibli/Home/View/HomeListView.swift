//
//  ContentView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import SwiftUI

struct HomeListView: View {
    @StateObject var viewModel: HomeListViewModel

    let columns = [
        GridItem(.flexible(), alignment: .top),
        GridItem(.flexible(), alignment: .top)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Movies")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ghibliPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.movies) { movie in
                        
                        if let url = URL(string: movie.image) {
                            NavigationLink {
                                HomeDetailList(movie: movie)
                            } label: {
                                HomeCard(
                                    viewModel: HomeCardViewModel(
                                        title: movie.title,
                                        image: url
                                    )
                                )
                            }

                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            .background(Color.black)
            .onAppear {
                if viewModel.movies.isEmpty {
                    Task {
                        await viewModel.getMovies()
                    }
                }
            }
        }
    }
}
