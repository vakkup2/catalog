//
//  NetworkError.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noInternetConnection
    case parsingFailed
}
