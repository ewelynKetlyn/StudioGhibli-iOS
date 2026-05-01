//
//  LocationListView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import SwiftUI

struct LocationListView: View {
    @StateObject var viewModel: LocationsListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .foregroundStyle(.ghibliPrimary)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView {
                ForEach(viewModel.locations) { locations in
                    LocationCardView(
                        viewModel: LocationCardViewModel(
                            title: locations.name,
                            climate: locations.climate,
                            terrain: locations.terrain,
                            water: locations.surfaceWater,
                            residents: locations.residents,
                            movies: locations.films
                        )
                    )
                }
                .padding(4)
            }
        }
        .background(Color.black)
        .onAppear {
            if viewModel.locations.isEmpty {
                Task {
                    await viewModel.getLocations()
                }
            }
        }
    }
}
