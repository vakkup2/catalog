//
//  VideoInteractor.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IVideoInteractor {
    func play(request: Play.Request)
}

struct VideoInteractor: IVideoInteractor {
    let worker: IVideoWorker
    let presenter: IVideoPresenter
 
    func play(request: Play.Request) {
        let response = Play.Response(key: worker.key)
        presenter.present(response: response)
    }
}
