//
//  LocationsViewModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 24/04/26.
//

import Foundation
import Combine

//lembrar de renomear para locationListViewModel !!!
class LocationsListViewModel: ObservableObject {
    @Published var locations: [LocationsModel] = []
    @Published var isLoading: Bool = false
    
    private var repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol = Repository()) {
        self.repo = repo
    }
    
    //Mark: Fetch data
    func getLocations() async {
        isLoading = true
        do {
            locations = try await repo.getLocations()
        } catch {
            print("Error")
        }
        
        isLoading = false
    }
    
}
