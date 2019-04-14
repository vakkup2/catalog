//
//  VideoAssembly.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

class VideoAssembly {
    private enum Constants {
        static let storyboardName = "Video"
        static let storyboardVCId = "VideoViewControllerId"
    }
    
    static func build(key: String) -> UIViewController {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        guard let viewController: VideoViewController = storyboard.instantiateViewController(withIdentifier: Constants.storyboardVCId) as? VideoViewController else {
            assertionFailure("Unable to instantiate viewController")
            
            return UIViewController()
        }
        
        let inMemoryStorage = VideoInMemoryStorage(key: key)
        
        let worker = VideoWorker(inMemoryStorage: inMemoryStorage)
        let presenter = VideoPresenter(viewController: viewController)
        let interactor = VideoInteractor(worker: worker, presenter: presenter)
        
        let router = VideoRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
