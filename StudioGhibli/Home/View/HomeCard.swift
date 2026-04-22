//
//  HomeCard.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import SwiftUI
import Combine

struct HomeCard: View {

    @StateObject var viewModel: HomeCardViewModel

    var body: some View {
        VStack(alignment: .leading) {

            AsyncImage(url: viewModel.image) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.2)
                    ProgressView()
                }
            }
            .aspectRatio(2/3, contentMode: .fit)

            Text(viewModel.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
                .padding(.leading, 2)

            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 5.0)
    }
}

#Preview {
    HomeCard(
        viewModel: HomeCardViewModel(
            title: "Castle in Sky",
            image: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg")!
        )
    )
}
