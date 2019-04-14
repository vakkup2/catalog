//
//  CatalogCellModel.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import SDWebImage

struct CatalogCellModel {
    let viewModel: CatalogCellViewModel
}

extension CatalogCellModel: ICellViewModel {
    func setup(cell: CatalogCell) {
        cell.titleLabel.text = viewModel.title
        cell.posterImageView.sd_setImage(with: viewModel.posterURL, completed: nil)
    }
}
