//
//  CatalogWorkerMock.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

@testable import MovieCatalog

class CatalogWorkerMock: ICatalogWorker {
    //stubs
    var popularItemsStub: [ICatalogItem]?
    var errorStub: Error?
    
    //counters
    var popularCalled = 0
    
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void) {
        popularCalled += 1
        if let popularItems = popularItemsStub {
            completion(.success(popularItems))
        } else if let error = errorStub {
            completion(.failure(error))
        }
    }
}
