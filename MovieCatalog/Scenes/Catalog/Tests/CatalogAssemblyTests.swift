//
//  CatalogAssemblyTests.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import XCTest
@testable import MovieCatalog

class CatalogAssemblyTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBuildLayers() {
        //given
        
        //when
        let viewController = CatalogAssembly.build() as? CatalogViewController
        let interactor = viewController?.interactor as? CatalogInteractor
        let presenter = interactor?.presenter as? CatalogPresenter
        let worker = interactor?.worker as? CatalogWorker
        
        //then
        XCTAssertNotNil(viewController, "viewController should not be nil")
        XCTAssertNotNil(interactor, "interactor should not be nil")
        XCTAssertNotNil(presenter, "presenter should not be nil")
        XCTAssertNotNil(worker, "worker should not be nil")
    }
    
    func testLayersDependencies() {
        //given
        
        //when
        let viewController = CatalogAssembly.build() as? CatalogViewController
        let interactor = viewController?.interactor as? CatalogInteractor
        let presenter = interactor?.presenter as? CatalogPresenter
        
        //then
        XCTAssertEqual(viewController, presenter?.viewController as? CatalogViewController, "viewControllers should be same")
    }
}
