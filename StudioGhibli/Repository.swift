//
//  Repository.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 09/04/26.
//

import Foundation

protocol RepositoryProtocol {
    func getMovies() async throws -> [HomeMovieModel]
}

class Repository: RepositoryProtocol {
    private let service: Service
    
    init(service: Service = Service()) {
        self.service = service
    }
    
    func getMovies() async throws -> [HomeMovieModel] {
        return try await service.getMovies()
    }
}
