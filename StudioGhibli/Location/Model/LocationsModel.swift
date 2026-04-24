//
//  LocationsModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 24/04/26.
//

import Foundation

struct LocationsModel: Decodable, Identifiable {
    let id: String
    let name: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let residents: [String]
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case climate
        case terrain
        case surfaceWater = "surface_water"
        case residents
        case films
        case url
    }
}
