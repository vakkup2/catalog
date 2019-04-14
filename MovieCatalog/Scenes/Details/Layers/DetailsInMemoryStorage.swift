//
//  DetailsInMemoryStorage.swift
//  MovieDetails
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IDetailsInMemoryStorage {
    var id: Int { get }
}

struct DetailsInMemoryStorage: IDetailsInMemoryStorage {
    var id: Int
}
