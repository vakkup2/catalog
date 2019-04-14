//
//  CatalogResult.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

struct CatalogResult {
    let items: [CatalogItem]
}

extension CatalogResult: Decodable {
    private enum CodingKeys: String, CodingKey {
        case items = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([CatalogItem].self, forKey: .items)
    }
}
