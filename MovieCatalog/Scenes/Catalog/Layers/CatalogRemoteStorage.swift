//
//  CatalogRemoteStorage.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol ICatalogRemoteStorage {
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void)
}

struct CatalogRemoteStorage: ICatalogRemoteStorage {
    var apiService: ICatalogAPIService
    
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void) {
        apiService.popular(completion: completion)
    }
}
