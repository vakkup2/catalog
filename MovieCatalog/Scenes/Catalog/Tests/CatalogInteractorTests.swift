//
//  CatalogInteractorTests.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import XCTest
@testable import MovieCatalog

class CatalogInteractorTests: XCTestCase {
    var interactor: CatalogInteractor!
    var workerMock: CatalogWorkerMock!
    var presenterMock: CatalogPresenterMock!
    
    override func setUp() {
        super.setUp()
        workerMock = CatalogWorkerMock()
        presenterMock = CatalogPresenterMock()
        interactor = CatalogInteractor(worker: workerMock, presenter: presenterMock)
    }
    
    override func tearDown() {
        interactor = nil
        workerMock = nil
        presenterMock = nil
        super.tearDown()
    }
    
    // MARK: - testPopular
    
    func testPopular() {
        //given
        workerMock.popularItemsStub = [CatalogItem.testData()]
        workerMock.errorStub = NetworkError.parsingFailed

        let request = Catalog.Request()
        
        //when
        interactor.popular(request: request)
        
        //then
        XCTAssertEqual(workerMock.popularCalled, 1, "should call worker popular")
        XCTAssertEqual(presenterMock.presentCatalogCalled, 1, "should call presenter present catalog")
        XCTAssertEqual(presenterMock.catalogResponse?.items.first?.id, workerMock.popularItemsStub?.first?.id, "should check presenter present popular id")
    }
    
    func testPopularError() {
        //given
        workerMock.popularItemsStub = nil
        workerMock.errorStub = NetworkError.parsingFailed
        
        let request = Catalog.Request()
        
        //when
        interactor.popular(request: request)
        
        //then
        XCTAssertEqual(workerMock.popularCalled, 1, "should call worker popular")
        XCTAssertEqual(presenterMock.presentErrorCalled, 1, "should call presenter present error")
    }
}
