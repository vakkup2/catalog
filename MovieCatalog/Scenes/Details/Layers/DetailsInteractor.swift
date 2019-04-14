//
//  DetailsInteractor.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IDetailsInteractor {
    func details(request: Details.Request)
    func videos(request: Videos.Request)
}

struct DetailsInteractor: IDetailsInteractor {
    let worker: IDetailsWorker
    let presenter: IDetailsPresenter
    
    func details(request: Details.Request) {
        worker.details(id: worker.id) { result in
            switch result {
            case .success(let item):
                let response = Details.Response(item: item)
                self.presenter.present(details: response)
            case .failure(let error):
                let sceneError = SceneError(from: error)
                self.presenter.present(error: sceneError)
            }
        }
    }
    
    func videos(request: Videos.Request) {
        worker.videos(id: worker.id) { result in
            switch result {
            case .success(let items):
                let response = Videos.Response(items: items)
                self.presenter.present(videos: response)
            case .failure(let error):
                let sceneError = SceneError(from: error)
                self.presenter.present(error: sceneError)
            }
        }
    }
}
