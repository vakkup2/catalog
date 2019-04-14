//
//  CatalogInteractor.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol ICatalogInteractor {
    func popular(request: Catalog.Request)
}

struct CatalogInteractor {
    let worker: ICatalogWorker
    let presenter: ICatalogPresenter
}

extension CatalogInteractor: ICatalogInteractor {
    func popular(request: Catalog.Request) {
        worker.popular { result in
            switch result {
            case .success(let items):
                let response = Catalog.Response(items: items)
                self.presenter.present(catalog: response)
            case .failure(let error):
                let sceneError = SceneError(from: error)
                self.presenter.present(error: sceneError)
            }
        }
    }
}
