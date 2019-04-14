//
//  DetailsAPIService.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation
import Moya

protocol IDetailsAPIService {
    func details(id: Int, completion: @escaping (Result<IDetailsItem, Error>) -> Void)
    func videos(id: Int, completion: @escaping (Result<[IVideoItem], Error>) -> Void)
}

struct DetailsAPIService: IDetailsAPIService {
    let provider = MoyaProvider<NetworkRequests>()
    
    func details(id: Int, completion: @escaping (Result<IDetailsItem, Error>) -> Void) {
        provider.request(.details(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let details = try JSONDecoder().decode(DetailsItem.self, from: response.data)
                    completion(.success(details))
                } catch {
                    completion(.failure(NetworkError.parsingFailed))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func videos(id: Int, completion: @escaping (Result<[IVideoItem], Error>) -> Void) {
        provider.request(.videos(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(VideoResult.self, from: response.data)
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
