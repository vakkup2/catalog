//
//  RootNavigationController.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        handleFlow()
    }
}

private extension RootNavigationController {
    func handleFlow() {
        setViewControllers([CatalogAssembly.build()], animated: false)
    }
}
