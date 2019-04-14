//
//  CatalogViewControllerMock.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

@testable import MovieCatalog

class CatalogViewControllerMock: ICatalogViewController {
    //counters
    var showCatalogCalled = 0
    var showErrorCalled = 0
    
    //saved variables
    var catalogViewModel: Catalog.ViewModel?
    var showError: ISceneError?
    
    func show(catalog viewModel: Catalog.ViewModel) {
        showCatalogCalled += 1
        catalogViewModel = viewModel
    }
    
    func show(error: ISceneError) {
        showErrorCalled += 1
        showError = error
    }
}
