//
//  TVShowDetailRouter.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//  
//

import Foundation
import UIKit

class TVShowDetailRouter {}

// MARK: - TVShowDetailRouterProtocol

extension TVShowDetailRouter: TVShowDetailPresenterToRouterProtocol {
    
    static func createModule(withTVShowId tvShowId: Int) -> UIViewController {
        // View Controller.
        let viewController = TVShowDetailViewController()
        
        // Presenter.
        let presenter: TVShowDetailViewToPresenterProtocol & TVShowDetailInteractorToPresenterProtocol = TVShowDetailPresenter()
        
        // Dependency injection to View.
        viewController.presenter = presenter
        viewController.presenter?.tvShowId = tvShowId // The ID of the TVShow selected by the user.
        
        // Dependency injection to Presenter.
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TVShowDetailInteractor()
        viewController.presenter?.router = TVShowDetailRouter()
        
        // Dependency injection to Interactor.
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
