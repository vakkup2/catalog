//
//  DetailsRemoteStorage.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IDetailsRemoteStorage {
    func details(id: Int, completion: @escaping (Result<IDetailsItem, Error>) -> Void)
    func videos(id: Int, completion: @escaping (Result<[IVideoItem], Error>) -> Void)
}

struct DetailsRemoteStorage: IDetailsRemoteStorage {
    var apiService: IDetailsAPIService
    
    func details(id: Int, completion: @escaping (Result<IDetailsItem, Error>) -> Void) {
        apiService.details(id: id, completion: completion)
    }
    
    func videos(id: Int, completion: @escaping (Result<[IVideoItem], Error>) -> Void) {
        apiService.videos(id: id, completion: completion)
    }
}
