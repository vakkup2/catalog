//
//  CatalogItemMock.swift
//  MovieCatalogTests
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

@testable import MovieCatalog

extension CatalogItem {
    static func testData() -> CatalogItem {
        return CatalogItem(id: 1, posterPath: "path", title: "title")
    }
}
