//
//  PeopleListModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 01/03/26.
//

import Foundation

struct PeopleListModel: Codable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films: [String]
    let species: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case films, species, url
    }
}
