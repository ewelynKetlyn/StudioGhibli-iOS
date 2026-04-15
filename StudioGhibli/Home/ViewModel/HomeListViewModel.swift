//
//  HomeListViewModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 05/03/26.
//

import Foundation
import Combine

class HomeListViewModel: ObservableObject {
    @Published var movies: [HomeMovieModel] = []
    @Published var isLoading: Bool = false
    
    private let movieRepository: RepositoryProtocol
    
    init(movieRepository: RepositoryProtocol = Repository()) {
        self.movieRepository = movieRepository
    }
    
    //Mark: Fetch Datas
    func getMovies() async {
        isLoading = true
        do {
            movies = try await movieRepository.getMovies()
        } catch {
            print("Error")
        }
        
        isLoading = false
    }
}
