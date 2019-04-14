//
//  VideoInMemoryStorage.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IVideoInMemoryStorage {
    var key: String { get }
}

struct VideoInMemoryStorage: IVideoInMemoryStorage {
    var key: String
}
