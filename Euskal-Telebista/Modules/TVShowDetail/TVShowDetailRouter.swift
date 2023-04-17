//
//  TVShowDetailRouter.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//  
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class TVShowDetailRouter {}

// MARK: - TVShowDetailRouterProtocol

extension TVShowDetailRouter: TVShowDetailPresenterToRouterProtocol {
    
    static func createModule(withTVShowId tvShowId: Int) -> UIViewController {
        // View Controller.
        let viewController = TVShowDetailViewController()
        
        // Presenter.
        let presenter: TVShowDetailViewToPresenterProtocol & TVShowDetailInteractorToPresenterProtocol = TVShowDetailPresenter()
        
        // Interactor.
        let interactor: TVShowDetailPresenterToInteractorProtocol & TVShowDetailAPIManagerToInteractorProtocol = TVShowDetailInteractor()
        
        // API Manager.
        let apiManager: APIManagerProtocol & TVShowDetailInteractorToAPIManagerProtocol & TVShowDetailInteractorToAPIManagerProtocol = APIManager()
        
        // Dependency injection to View.
        viewController.presenter = presenter
        viewController.presenter?.tvShowId = tvShowId // The ID of the TVShow selected by the user.
        
        // Dependency injection to Presenter.
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.router = TVShowDetailRouter()
        
        // Dependency injection to Interactor.
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.apiManager = apiManager
        viewController.presenter?.interactor?.apiManager?.interactorTVShowDetail = interactor
        
        return viewController
    }
    
    func openVideoPlayer(on view: TVShowDetailPresenterToViewProtocol, videoURL: URL) {
        let player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        let vc = view as! TVShowDetailViewController
        vc.present(playerController, animated: true)
    }
    
}
