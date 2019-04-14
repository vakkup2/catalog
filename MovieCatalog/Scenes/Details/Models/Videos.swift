//
//  Videos.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

enum Videos {
    struct Request {
        
    }
    
    struct Response {
        var items: [IVideoItem]
    }
    
    struct ViewModel {
        var key: String?
    }
}
