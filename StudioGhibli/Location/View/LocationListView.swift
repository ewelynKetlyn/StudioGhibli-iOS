//
//  LocationListView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import SwiftUI

struct LocationListView: View {
    var body: some View {
        Text("Location")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView {
            ForEach(0..<20, id: \.self) { _ in
                LocationCardView()
            }
            .padding(4)
        }
    }
}

#Preview {
    LocationListView()
}
