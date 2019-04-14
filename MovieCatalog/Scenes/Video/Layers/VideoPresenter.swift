//
//  VideoPresenter.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

protocol IVideoPresenter {
    func present(response: Play.Response)
}

struct VideoPresenter: IVideoPresenter {
    var viewController: IVideoViewController
    
    func present(response: Play.Response) {
        let viewModel = Play.ViewModel(key: response.key)
        viewController.show(viewModel: viewModel)
    }
}
