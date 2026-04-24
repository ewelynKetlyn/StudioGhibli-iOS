//
//  AppTabView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            HomeListView(viewModel: HomeListViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PeopleListView()
                .tabItem {
                    Label("People", systemImage: "person")
                }
            
            LocationListView(viewModel: LocationsListViewModel())
                .tabItem {
                    Label("Location", systemImage: "rectangle.stack")
                }
        }
        .tint(.ghibliPrimary)
        .background(Color.black)
    }
}

#Preview {
    AppTabView()
}
