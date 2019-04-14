//
//  UITableView.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeueReusableHeaderFooter(withModel model: ICellViewAnyModel) -> UITableViewHeaderFooterView? {
        let headerFooter = dequeueReusableHeaderFooterView(withIdentifier: model.identifier)
        headerFooter.flatMap { model.setupAny(cell: $0) }
        return headerFooter
    }
    
    func dequeueReusableCell(withModel model: ICellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: model.identifier, for: indexPath)
        model.setupAny(cell: cell)
        return cell
    }
    
    func register(_ nibModels: ICellViewAnyModel.Type...) {
        nibModels.forEach {
            let identifier = String(describing: $0.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    func registerHeaderFooter(_ nibModels: ICellViewAnyModel.Type...) {
        nibModels.forEach {
            let identifier = String(describing: $0.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}
