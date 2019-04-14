//
//  CatalogAssembly.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

class CatalogAssembly {
    private enum Constants {
        static let storyboardName = "Catalog"
        static let storyboardVCId = "CatalogViewControllerId"
    }
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        guard let viewController: CatalogViewController = storyboard.instantiateViewController(withIdentifier: Constants.storyboardVCId) as? CatalogViewController else {
            assertionFailure("Unable to instantiate viewController")
            
            return UIViewController()
        }
        
        let remoteStorage = CatalogRemoteStorage(apiService: CatalogAPIService())
        let localStorage = CatalogLocalStorage()
        let inMemoryStorage = CatalogInMemoryStorage()
        
        let worker = CatalogWorker(remoteStorage: remoteStorage, localStorage: localStorage, inMemoryStorage: inMemoryStorage)
        let presenter = CatalogPresenter(viewController: viewController)
        let interactor = CatalogInteractor(worker: worker, presenter: presenter)
        
        let router = CatalogRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
