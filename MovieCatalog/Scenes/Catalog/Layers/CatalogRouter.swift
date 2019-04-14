//
//  CatalogRouter.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

protocol ICatalogRouter {
    func openDetails(id: Int, from: UINavigationController?)
}

struct CatalogRouter: ICatalogRouter {
    func openDetails(id: Int, from: UINavigationController?) {
        guard let navigationController = from else {
            return
        }
        
        let detailsController = DetailsAssembly.build(id: id)
        
        navigationController.pushViewController(detailsController, animated: true)
    }
}
