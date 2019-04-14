//
//  DetailsWorker.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IDetailsWorker {
    var id: Int { get }
    
    func details(id: Int, completion: @escaping (Result<IDetailsItem, Error>) -> Void)
    func videos(id: Int, completion: @escaping (Result<[IVideoItem], Error>) -> Void)
}

struct DetailsWorker: IDetailsWorker {
    let remoteStorage: IDetailsRemoteStorage
    let localStorage: IDetailsLocalStorage
    let inMemoryStorage: IDetailsInMemoryStorage
    
    var id: Int {
        return inMemoryStorage.id
    }
    
    func details(id: Int, completion: @escaping (Result<IDetailsItem, Error>) -> Void) {
        remoteStorage.details(id: id, completion: completion)
    }
    
    func videos(id: Int, completion: @escaping (Result<[IVideoItem], Error>) -> Void) {
        remoteStorage.videos(id: id, completion: completion)
    }
}
