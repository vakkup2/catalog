//
//  UIAlertController.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func create(from error: ISceneError) -> UIAlertController {
        let cancel = UIAlertAction.init(title: NSLocalizedString("Close", comment: ""), style: .default, handler: nil)
        let controller = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        controller.addAction(cancel)
        
        return controller
    }
}
