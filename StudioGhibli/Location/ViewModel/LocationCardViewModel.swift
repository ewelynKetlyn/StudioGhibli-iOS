//
//  LocationCardViewModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 24/04/26.
//

import Foundation
import Combine

class LocationCardViewModel: ObservableObject {
    public var title: String
    
    init(title: String) {
        self.title = title
    }
}
