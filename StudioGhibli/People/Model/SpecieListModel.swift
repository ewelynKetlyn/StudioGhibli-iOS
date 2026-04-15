//
//  SpecieListModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 01/03/26.
//

import Foundation

struct SpecieListModel: Codable {
    let id: String
    let name: String
    let classification: String
    let eyeColors: String
    let hairColors: String
    let people: [String]
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, classification
        case eyeColors = "eye_colors"
        case hairColors = "hair_colors"
        case people, films
    }
}
