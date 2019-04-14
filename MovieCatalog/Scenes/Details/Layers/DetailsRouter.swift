//
//  DetailsRouter.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

protocol IDetailsRouter {
    func openVideo(key: String?, from: UIViewController?)
}

struct DetailsRouter: IDetailsRouter {
    func openVideo(key: String?, from: UIViewController?) {
        guard let controller = from, let key = key else {
            return
        }
        
        let videoController = VideoAssembly.build(key: key)
        
        controller.present(videoController, animated: true)
    }
}
