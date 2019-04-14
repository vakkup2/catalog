//
//  CatalogWorker.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol ICatalogWorker {
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void)
}

struct CatalogWorker: ICatalogWorker {
    let remoteStorage: ICatalogRemoteStorage
    let localStorage: ICatalogLocalStorage
    let inMemoryStorage: ICatalogInMemoryStorage
    
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void) {
        remoteStorage.popular(completion: completion)
    }
}
