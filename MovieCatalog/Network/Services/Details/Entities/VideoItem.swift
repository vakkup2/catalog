//
//  VideoItem.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

protocol IVideoItem {
    var name: String? { get }
    var key: String? { get }
}

struct VideoItem: IVideoItem, Decodable {
    var name: String?
    var key: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case key
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decodeIfPresent(String.self, forKey: .name)
        key = try container.decodeIfPresent(String.self, forKey: .key)
    }
}
