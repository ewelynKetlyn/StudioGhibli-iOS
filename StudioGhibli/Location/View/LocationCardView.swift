//
//  LocationCardView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 01/03/26.
//

import SwiftUI

struct LocationCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Irontown")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.blue)
            
            HStack {
                Text("climate:")
                    .font(.title2)
                Text("Mountain")
                    .font(.title2)
            }
            .foregroundStyle(Color.gray)
        }
        .padding(.leading, 4)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.blue, lineWidth: 2)
        )
    }
}

#Preview {
    LocationCardView()
}
