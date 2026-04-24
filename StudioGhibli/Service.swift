//
//  Service.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 05/03/26.
//

import Foundation

enum Endpoint {
    case films
    case locations
    
    var path: String {
        switch self {
        case .films:
            return "/films"
        case .locations:
            return "/locations"
        }
    }
}

class Service {
    private let baseURL = "https://ghibliapi.vercel.app"

    func getMovies() async throws -> [HomeMovieModel] {
        // Monta a URL completa
        guard let url = URL(string: "\(baseURL)\(Endpoint.films.path)") else {
            throw URLError(.badURL)
        }

        // Faz a requisição
        let (data, response) = try await URLSession.shared.data(from: url)

        // Verifica se a resposta é válida
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        // Decodifica o JSON
        let movies = try JSONDecoder().decode([HomeMovieModel].self, from: data)

        return movies
    }
    
    //Mark: Requisicao da lista de locations
    func getLocations() async throws -> [LocationsModel] {
        guard let url = URL(string: "\(baseURL)\(Endpoint.locations.path)") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let locations = try JSONDecoder().decode([LocationsModel].self, from: data)
        return locations
    }
}
