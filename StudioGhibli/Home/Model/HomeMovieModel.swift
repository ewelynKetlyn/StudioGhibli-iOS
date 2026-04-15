//
//  HomeMovieModel.swift
//  StudioGhibli
//
//  Created by Ewelyn Silva on 28/02/26.
//

import Foundation

struct HomeMovieModel: Codable, Identifiable {
    let id: String
    let title: String
    let originalTitle: String
    let originalTitleRomanised: String
    let image: String
    let imageBanner: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let rtScore: String
    let people: [String]
    let species: [String]
    let locations: [String]
    let vehicles: [String]
    let url: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case image
        case imageBanner = "movie_banner"
        case description, director, producer
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
        case people, species, locations, vehicles, url
    }
    
}

import Playgrounds
#Playground {
    
    let url = URL(string: "https://ghibliapi.vercel.app/films")!

    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        try JSONDecoder().decode([HomeMovieModel].self, from: data)
    }
    catch {
        print(error)
    }
}
