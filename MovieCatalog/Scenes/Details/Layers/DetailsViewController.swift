//
//  DetailsViewController.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit
import SDWebImage

protocol IDetailsViewController: class {
    func show(details viewModel: Details.ViewModel)
    func show(videos viewModel: Videos.ViewModel)
    func show(error: ISceneError)
}

class DetailsViewController: UIViewController {
    var interactor: IDetailsInteractor!
    var router: IDetailsRouter!
    
    // MARK: IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
}

// MARK: IBActions

private extension DetailsViewController {
    @IBAction func play(_ sender: Any) {
        interactor.videos(request: Videos.Request())
    }
}

// MARK: Data loading

extension DetailsViewController {
    func loadData() {
        interactor.details(request: Details.Request())
    }
}

// MARK: IDetailsViewController

extension DetailsViewController: IDetailsViewController {
    func show(details viewModel: Details.ViewModel) {
        posterImageView.sd_setImage(with: viewModel.posterURL, completed: nil)
        titleLabel.text = viewModel.title
        genresLabel.text = viewModel.genres
        datesLabel.text = viewModel.dates
        overviewLabel.text = viewModel.overview
    }
    
    func show(videos viewModel: Videos.ViewModel) {
        router.openVideo(key: viewModel.key, from: self)
    }
    
    func show(error: ISceneError) {
        present(UIAlertController.create(from: error), animated: true, completion: nil)
    }
}
