//
//  DetailsAssembly.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//
import UIKit

class DetailsAssembly {
    private enum Constants {
        static let storyboardName = "Details"
        static let storyboardVCId = "DetailsViewControllerId"
    }
    
    static func build(id: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        guard let viewController: DetailsViewController = storyboard.instantiateViewController(withIdentifier: Constants.storyboardVCId) as? DetailsViewController else {
            assertionFailure("Unable to instantiate viewController")
            
            return UIViewController()
        }
        
        let remoteStorage = DetailsRemoteStorage(apiService: DetailsAPIService())
        let localStorage = DetailsLocalStorage()
        let inMemoryStorage = DetailsInMemoryStorage(id: id)
        
        let worker = DetailsWorker(remoteStorage: remoteStorage, localStorage: localStorage, inMemoryStorage: inMemoryStorage)
        let presenter = DetailsPresenter(viewController: viewController)
        let interactor = DetailsInteractor(worker: worker, presenter: presenter)
        
        let router = DetailsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
