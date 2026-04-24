//
//  LocationCardView.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 01/03/26.
//

import SwiftUI

struct LocationCardView: View {
    @StateObject var viewModel: LocationCardViewModel

    var body: some View {
        HStack {
            //imageCardView
            nameCardView
            Spacer()
            Divider()
                .background(Color.white)
            informationsCard
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.locationCardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 4.0))
        .shadow(radius: 5.0)
    }
    
    private var nameCardView: some View {
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.blue)
            
            HStack {
                Image(systemName: "cloud.fill")
                Text("continental")
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
            
            HStack {
                Image(systemName: "cloud.fill")
                Text("Mountain")
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 4.0))
        }
    }
    
    private var informationsCard: some View {
        VStack(alignment: .leading, spacing: 6) {
            infoRow(icon: "drop.fill", label: "Surface water:", value: "40%")
            infoRow(icon: "person.2.fill", label: "Residents:", value: "4")
            infoRow(icon: "film.fill", label: "Number of films:", value: "2")
        }
    }
    
    private func infoRow(icon: String, label: String, value: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .frame(width: 20)
            
            Text(label)
                .font(.caption)
            
            Text(value)
                .font(.caption)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.gray)
    }
}
