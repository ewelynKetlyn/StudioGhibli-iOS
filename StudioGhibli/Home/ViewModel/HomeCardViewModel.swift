//
//  HomeCardViewModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 13/04/26.
//

import Foundation
import Combine

public class HomeCardViewModel: ObservableObject {
    public var title: String
    public var image: URL

    init(title: String, image: URL) {
        self.title = title
        self.image = image
    }
}
