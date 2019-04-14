//
//  VideoRouter.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

protocol IVideoRouter {
    func dismiss(viewController: UIViewController)
}

struct VideoRouter: IVideoRouter {
    func dismiss(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
