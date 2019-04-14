//
//  Details.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

enum Details {
    struct Request {
        
    }
    
    struct Response {
        var item: IDetailsItem
    }
    
    struct ViewModel {
        var posterURL: URL?
        var title: String?
        var genres: String?
        var dates: String?
        var overview: String?
    }
}
