//
//  CatalogAPIService.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation
import Moya

protocol ICatalogAPIService {
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void)
}

struct CatalogAPIService: ICatalogAPIService {
    let provider = MoyaProvider<NetworkRequests>()
    
    func popular(completion: @escaping (Result<[ICatalogItem], Error>) -> Void) {
        provider.request(.popular) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(CatalogResult.self, from: response.data)
                    completion(.success(result.items))
                } catch {
                    completion(.failure(NetworkError.parsingFailed))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
