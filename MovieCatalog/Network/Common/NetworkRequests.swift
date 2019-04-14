//
//  NetworkRequestss.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Moya

private struct RequestParameters {
    struct Keys {
        static let apiKey = "api_key"
    }
}

enum NetworkRequests {
    case popular
    case details(id: Int)
    case videos(id: Int)
}

extension NetworkRequests: TargetType {
    var baseURL: URL {
        guard let url = URL(string: NetworkConfiguration.ServerHosts.baseUrl) else {
            fatalError("Invalid baseURL")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .popular: return NetworkConfiguration.Paths.popular
        case .details(let id): return "\(id)"
        case .videos(let id): return ["\(id)", NetworkConfiguration.Paths.videos].joined(separator: "/")
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: [RequestParameters.Keys.apiKey: NetworkConfiguration.APIKeys.key], encoding: URLEncoding.queryString)
    }
    
    var headers: [String: String]? {
        return nil
    }
}

extension NetworkRequests: MoyaCacheable {
    var cachePolicy: MoyaCacheablePolicy {
        return .returnCacheDataElseLoad
    }
}
