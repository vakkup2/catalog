//
//  VideoWorker.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IVideoWorker {
    var key: String { get }
}

struct VideoWorker: IVideoWorker {
    let inMemoryStorage: IVideoInMemoryStorage
    
    var key: String {
        return inMemoryStorage.key
    }
}
