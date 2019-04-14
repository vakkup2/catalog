//
//  Catalog.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

enum Catalog {
    struct Request {
        
    }
    
    struct Response {
        var items: [ICatalogItem]
    }
    
    struct ViewModel {
        var items: [CatalogCellViewModel]
    }
}
