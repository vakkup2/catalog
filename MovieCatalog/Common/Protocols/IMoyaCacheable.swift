//
//  IMoyaCacheable.swift
//  MovieCatalog
//
//  Created by Bogdan Andresyuk on 4/14/19.
//  Copyright © 2019 Bogdan Andresyuk. All rights reserved.
//

import Foundation

protocol MoyaCacheable {
    typealias MoyaCacheablePolicy = URLRequest.CachePolicy
    var cachePolicy: MoyaCacheablePolicy { get }
}
