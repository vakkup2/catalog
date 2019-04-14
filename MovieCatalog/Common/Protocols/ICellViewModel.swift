//
//  ICellViewModel.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

protocol ICellViewAnyModel {
    static var cellAnyType: UIView.Type { get }
    
    var identifier: String { get }
    
    func setupAny(cell: UIView)
}

protocol ICellViewModel: ICellViewAnyModel {
    associatedtype CellType: UIView
    
    func setup(cell: CellType)
}

extension ICellViewModel {
    static var cellAnyType: UIView.Type {
        return CellType.self
    }
    
    var identifier: String {
        return String(describing: Self.cellAnyType.self)
    }
    
    func setupAny(cell: UIView) {
        guard let cell = cell as? CellType else {
            return
        }
        
        setup(cell: cell)
    }
}
