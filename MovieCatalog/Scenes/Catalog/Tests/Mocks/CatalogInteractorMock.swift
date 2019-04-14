//
//  CatalogInteractorMock.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

@testable import MovieCatalog

class CatalogInteractorMock: ICatalogInteractor {
    //counters
    var popularCalled = 0
    
    //saved variables
    var catalogRequest: Catalog.Request?
    
    func popular(request: Catalog.Request) {
        popularCalled += 1
        catalogRequest = request
    }
}
