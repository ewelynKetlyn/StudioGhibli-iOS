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
}

class LocationCardViewModel: ObservableObject {
    public var title: String
    public var climate: String
    public var terrain: String
    public var water: String
    @Published public var cardType: ClimateCardType
    
    init(title: String, climate: String, terrain: String, water: String?) {
        self.title = title
        self.climate = climate
        self.terrain = terrain
        if let water = water, !water.isEmpty {
            self.water = water
        } else {
            self.water = "desconhecido"
        }
        self.cardType = ClimateCardType(from: climate)
    }
    
    func cardTaypeBackgroundColor() -> Color {
        switch cardType {
        case .continental:  return Color(.tagContinentalBackground)
        case .todo: return Color(.tagDefaultBackground)
        case .tropical: return Color(.tagTropicalBackground)
        case .mild: return Color(.tagMildBackground)
        case .wet: return Color(.tagWetBackground)
        }
    }
    
    func cardTypeTextColor() -> Color {
        switch cardType {
        case .continental: return Color(.tagContinentalText)
        case .todo: return Color(.tagDefaultText)
        case .tropical: return Color(.tagTropicalText)
        case .mild: return Color(.tagMildText)
        case .wet: return Color(.tagWetText)
        }
    }
    
}
