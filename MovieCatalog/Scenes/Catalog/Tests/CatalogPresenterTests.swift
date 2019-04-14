//
//  CatalogPresenterTests.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import XCTest
@testable import MovieCatalog

class CatalogPresenterTests: XCTestCase {
    var presenter: CatalogPresenter!
    var viewControllerMock: CatalogViewControllerMock!
    
    override func setUp() {
        super.setUp()
        viewControllerMock = CatalogViewControllerMock()
        presenter = CatalogPresenter(viewController: viewControllerMock)
    }
    
    override func tearDown() {
        viewControllerMock = nil
        presenter = nil
        super.tearDown()
    }
    
    // MARK: testPresent catalog
    func testPresentCatalog() {
        //given
        let items = [CatalogItem.testData()]
        
        let response = Catalog.Response(items: items)
        
        //when
        presenter.present(catalog: response)
        
        //then
        XCTAssertEqual(viewControllerMock.showCatalogCalled, 1, "should call viewController show catalog")
        XCTAssertEqual(viewControllerMock.catalogViewModel?.items.first?.id, items.first?.id, "should check viewController show catalog id")
    }
    
    // MARK: testPresent error
    func testPresentError() {
        //given
        let error = SceneError(from: NetworkError.parsingFailed)
        
        //when
        presenter.present(error: error)
        
        //then
        XCTAssertEqual(viewControllerMock.showErrorCalled, 1, "should call viewController show error")
    }
}
