//
//  LocationCardViewModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 24/04/26.
//

import Foundation
import Combine
import SwiftUI

public enum ClimateCardType: String {
    case continental
    case todo
    case tropical
    case mild
    case wet
    
    init(from climate: String) {
        self = ClimateCardType(rawValue: climate.lowercased()) ?? .todo
    }

    var displayName: String {
        switch self {
        case .continental: return "Continental"
        case .tropical: return "Tropical"
        case .mild: return "Mild"
        case .wet: return "Wet"
        case .todo: return "Unknown"
        }
    }

    var iconName: String {
        switch self {
        case .continental: return "cloud.fill"
        case .tropical: return "sun.max.fill"
        case .mild: return "leaf.fill"
        case .wet: return "cloud.rain.fill"
        case .todo: return "questionmark.circle.fill"
        }
    }
}

public enum TerrainCardType: String {
    case hill
    case todo
    case plain
    case marsh
    case forest
    case city
    case river
    case ocean
    case montain

    init(from terrain: String) {
        self = TerrainCardType(rawValue: terrain.lowercased()) ?? .todo
    }

    var displayName: String {
        switch self {
            case .hill: return "Hill"
            case .todo: return "Unknown"
            case .plain: return "Plain"
            case .marsh: return "Marsh"
            case .forest: return "Forest"
            case .city: return "City"
            case .river: return "River"
            case .ocean: return "Ocean"
            case .montain: return "Mountain"
        }
    }

    var iconName: String {
        switch self {
            case .hill: return "mountain.2.fill"
            case .todo: return "questionmark.circle.fill"
            case .plain: return "leaf.fill"
            case .marsh: return "drop.fill"
            case .forest: return "tree.fill"
            case .city: return "building.2.fill"
            case .river: return "water.waves"
            case .ocean: return "water.waves"
            case .montain: return "mountain.2.fill"
        }
    }
}

class LocationCardViewModel: ObservableObject {
    public var title: String
    public var climate: String
    public var terrain: String
    public var water: String
    public var residents: [String]
    public var movies: [String]
    @Published public var climateCardType: ClimateCardType
    @Published public var terrainCardType: TerrainCardType

    init(title: String, climate: String, terrain: String, water: String?, residents: [String], movies: [String]) {
        self.title = title
        self.climate = climate
        self.terrain = terrain
        self.residents = residents
        self.movies = movies
        if let water = water, !water.isEmpty {
            self.water = water
        } else {
            self.water = "desconhecido"
        }
        self.climateCardType = ClimateCardType(from: climate)
        self.terrainCardType = TerrainCardType(from: terrain)
    }

    func cardTypeClimateBackground() -> Color {
        switch climateCardType {
        case .continental:  return Color(.tagContinentalBackground)
        case .todo: return Color(.tagDefaultBackground)
        case .tropical: return Color(.tagTropicalBackground)
        case .mild: return Color(.tagMildBackground)
        case .wet: return Color(.tagWetBackground)
        }
    }

    func cardTypeClimateTextColor() -> Color {
        switch climateCardType {
        case .continental: return Color(.tagContinentalText)
        case .todo: return Color(.tagDefaultText)
        case .tropical: return Color(.tagTropicalText)
        case .mild: return Color(.tagMildText)
        case .wet: return Color(.tagWetText)
        }
    }
    
    func cardTypeTerrainBackground() -> Color {
        switch terrainCardType {
        case .hill: return Color(.tagHillBackground)
        case .todo: return Color(.tagDefaultBackground)
        case .plain: return Color(.tagPlainBackground)
        case .marsh: return Color(.tagMarshBackground)
        case .forest: return Color(.tagForestBackground)
        case .city: return Color(.tagCityBackground)
        case .river: return Color(.tagRiverBackground)
        case .ocean: return Color(.tagOceanBackground)
        case .montain: return Color(.tagMountainBackground)
        }
    }

    func cardTypeTerrainTextColor() -> Color {
        switch terrainCardType {
        case .hill: return Color(.tagHillText)
        case .todo: return Color(.tagDefaultText)
        case .plain: return Color(.tagPlainText)
        case .marsh: return Color(.tagMarshText)
        case .forest: return Color(.tagForestText)
        case .city: return Color(.tagCitytext)
        case .river: return Color(.tagRiverText)
        case .ocean: return Color(.tagOceanText)
        case .montain: return Color(.tagMountainText)
        }
    }

}
