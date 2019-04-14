//
//  CatalogItem.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

protocol ICatalogItem {
    var id: Int { get }
    var posterPath: String? { get }
    var title: String? { get }
}

struct CatalogItem: ICatalogItem, Decodable {
    var id: Int
    var posterPath: String?
    var title: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case title
    }
    
    init(id: Int, posterPath: String?, title: String?) {
        self.id = id
        self.posterPath = posterPath
        self.title = title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        posterPath = (try container.decodeIfPresent(String.self, forKey: .posterPath)).flatMap { "\(NetworkConfiguration.ServerHosts.imageUrl)/\($0)" }
        title = try container.decodeIfPresent(String.self, forKey: .title)
    }
}
