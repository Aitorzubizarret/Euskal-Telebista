//
//  MainRouter.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//  
//

import Foundation
import UIKit

class MainRouter {}

// MARK: - MainRouterProtocol

extension MainRouter: MainPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        // View Controller.
        let viewController = MainViewController()
        
        // Presenter.
        let presenter: MainViewToPresenterProtocol & MainInteractorToPresenterProtocol = MainPresenter()
        
        // Dependency injection to View.
        viewController.presenter = presenter
        
        // Dependency injection to Presenter.
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainInteractor()
        viewController.presenter?.router = MainRouter()
        
        // Dependency injection to Interactor.
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
