//
//  CatalogPresenterMock.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

@testable import MovieCatalog

class CatalogPresenterMock: ICatalogPresenter {
    //counters
    var presentCatalogCalled = 0
    var presentErrorCalled = 0
    
    //saved variables
    var catalogResponse: Catalog.Response?
    var presentError: ISceneError?
    
    func present(catalog response: Catalog.Response) {
        presentCatalogCalled += 1
        catalogResponse = response
    }
    
    func present(error: ISceneError) {
        presentErrorCalled += 1
        presentError = error
    }
}
