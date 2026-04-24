//
//  Repository.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 09/04/26.
//

import Foundation

protocol RepositoryProtocol {
    func getMovies() async throws -> [HomeMovieModel]
    func getLocations() async throws -> [LocationsModel]
}

class Repository: RepositoryProtocol {
    private let service: Service
    
    init(service: Service = Service()) {
        self.service = service
    }
    
    func getMovies() async throws -> [HomeMovieModel] {
        return try await service.getMovies()
    }
    
    func getLocations() async throws -> [LocationsModel] {
        return try await service.getLocations()
    }
}
