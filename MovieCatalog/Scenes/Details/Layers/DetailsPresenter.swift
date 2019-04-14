//
//  DetailsPresenter.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//
import Foundation

protocol IDetailsPresenter {
    func present(details response: Details.Response)
    func present(videos response: Videos.Response)
    func present(error: ISceneError)
}

struct DetailsPresenter: IDetailsPresenter {
    var viewController: IDetailsViewController
  
    func present(details response: Details.Response) {
        let viewModel = Details.ViewModel(
            posterURL: response.item.posterPath.flatMap { URL(string: $0) },
            title: response.item.title,
            genres: response.item.genres?.compactMap { $0.name }.joined(separator: ","),
            dates: response.item.releaseDate,
            overview: response.item.overview
        )
        
        viewController.show(details: viewModel)
    }
    
    func present(videos response: Videos.Response) {
        let viewModel = Videos.ViewModel(key: response.items.first.flatMap { $0.key })

        viewController.show(videos: viewModel)
    }
    
    func present(error: ISceneError) {
        viewController.show(error: error)
    }
}
