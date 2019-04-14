//
//  MoyaCacheablePlugin.swift
//  MovieCatalog
//
//  Created by Bogdan Andresyuk on 4/14/19.
//  Copyright © 2019 Bogdan Andresyuk. All rights reserved.
//

import Foundation
import Moya

final class MoyaCacheablePlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let moyaCachableProtocol = target as? MoyaCacheable {
            var cachableRequest = request
            cachableRequest.cachePolicy = moyaCachableProtocol.cachePolicy
            return cachableRequest
        }
        return request
    }
}
