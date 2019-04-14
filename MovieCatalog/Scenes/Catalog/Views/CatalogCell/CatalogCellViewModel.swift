//
//  CatalogCellViewModel.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

struct CatalogCellViewModel {
    var id: Int
    var posterURL: URL?
    var title: String?
    
    init(item: ICatalogItem) {
        id = item.id
        posterURL = item.posterPath.flatMap { URL(string: $0) }
        title = item.title
    }
}
