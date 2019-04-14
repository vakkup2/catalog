//
//  VideoViewController.swift
//  MovieCatalog
//
//  Created by NoName on 4/14/19.
//  Copyright © 2019 NoName. All rights reserved.
//

import UIKit
import YoutubeKit

protocol IVideoViewController: class {
    func show(viewModel: Play.ViewModel)
}

class VideoViewController: UIViewController {
    var interactor: IVideoInteractor!
    var router: IVideoRouter!
    
    var player: YTSwiftyPlayer!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
}

// MARK: Data loading

extension VideoViewController {
    func loadData() {
        interactor.play(request: Play.Request())
    }
}

// MARK: YTSwiftyPlayerDelegate

extension VideoViewController: YTSwiftyPlayerDelegate {
    func player(_ player: YTSwiftyPlayer, didChangeState state: YTSwiftyPlayerState) {
        if state == .ended || state == .paused {
            router.dismiss(viewController: self)
        }
    }
    
    func player(_ player: YTSwiftyPlayer, didReceiveError error: YTSwiftyPlayerError) {
        router.dismiss(viewController: self)
    }
    
    func youtubeIframeAPIFailedToLoad(_ player: YTSwiftyPlayer) {
        router.dismiss(viewController: self)
    }
}

// MARK: IVideoViewController

extension VideoViewController: IVideoViewController {
    func show(viewModel: Play.ViewModel) {
        player = YTSwiftyPlayer(frame: view.frame, playerVars: [.videoID(viewModel.key)])
        player.autoplay = true
        player.delegate = self
        
        view = player
        
        player.loadPlayer()
    }
}
