//
//  ISceneError.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import Foundation

protocol ISceneError: Error {
    var title: String { get }
    var message: String { get }
}

struct SceneError: ISceneError {
    let title: String
    let message: String
    
    init(title: String = NSLocalizedString("Error", comment: ""), message: String) {
        self.title = title
        self.message = message
    }
    
    init(from error: Error) {
        self.init(message: error.localizedDescription)
    }
}
