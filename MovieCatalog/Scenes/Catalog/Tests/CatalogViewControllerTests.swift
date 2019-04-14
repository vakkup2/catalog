//
//  CatalogViewControllerTests.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import XCTest
@testable import MovieCatalog

class CatalogViewControllerTests: XCTestCase {
    var viewController: CatalogViewController!
    var interactorMock: CatalogInteractorMock!
    
    override func setUp() {
        super.setUp()
        interactorMock = CatalogInteractorMock()
        viewController = CatalogAssembly.build() as? CatalogViewController
        viewController.interactor = interactorMock
    }
    
    override func tearDown() {
        viewController = nil
        interactorMock = nil
        super.tearDown()
    }
    
    // MARK: testLoadData
    
    func testLoadData() {
        //given
        
        //when
        viewController.loadData()
        
        //then
        XCTAssertEqual(interactorMock.popularCalled, 1, "should call interactor popular")
    }
}
