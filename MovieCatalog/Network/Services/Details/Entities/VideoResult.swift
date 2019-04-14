//
//  VideoResult.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

struct VideoResult {
    let items: [VideoItem]
}

extension VideoResult: Decodable {
    private enum CodingKeys: String, CodingKey {
        case items = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([VideoItem].self, forKey: .items)
    }
}
