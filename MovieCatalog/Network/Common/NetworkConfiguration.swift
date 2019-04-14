//
//  NetworkConfiguration.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

struct NetworkConfiguration {
    struct ServerHosts {
        static let baseUrl = "https://api.themoviedb.org/3/movie/"
        static let imageUrl = "https://image.tmdb.org/t/p/w200/"
        static let videoUrl = "https://www.youtube.com/watch?v="
    }
    
    struct APIKeys {
        static let key = "03a9dfd3c42397a31ca7ef7c0d4529fb"
    }
    
    struct Paths {
        static let popular = "popular"
        static let videos = "videos"
    }
}
