//
//  LocationListView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import SwiftUI

struct LocationListView: View {
    @StateObject var viewModel: LocationsViewModel

    var body: some View {
        Text("Location")
            .foregroundStyle(.ghibliPrimary)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView {
            ForEach(viewModel.locations) { locations in
                LocationCardView(viewModel: LocationCardViewModel(title: locations.name))
            }
            .padding(4)
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
