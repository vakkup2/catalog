//
//  DetailsItem.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

protocol IDetailsItem {
    var id: Int { get }
    var posterPath: String? { get }
    var title: String? { get }
    var genres: [IGenreItem]? { get }
    var releaseDate: String? { get }
    var overview: String? { get }
}

struct DetailsItem: IDetailsItem, Decodable {
    var id: Int
    var posterPath: String?
    var title: String?
    var genres: [IGenreItem]?
    var releaseDate: String?
    var overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
        case genres
        case releaseDate = "release_date"
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        posterPath = (try container.decodeIfPresent(String.self, forKey: .posterPath)).flatMap { "\(NetworkConfiguration.ServerHosts.imageUrl)/\($0)" }
        title = try container.decodeIfPresent(String.self, forKey: .title)
        genres = try container.decodeIfPresent([GenreItem].self, forKey: .genres)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
    }
}
