//
//  TVShowDetailProtocols.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//  
//

import Foundation
import UIKit

// MARK: - View

// PRESENTER -> VIEW
protocol TVShowDetailPresenterToViewProtocol {
    
    var presenter: TVShowDetailViewToPresenterProtocol? { get set }
    
}

// MARK: - Presenter

// VIEW -> PRESENTER
protocol TVShowDetailViewToPresenterProtocol {
    
    var view: TVShowDetailPresenterToViewProtocol? { get set }
    var interactor: TVShowDetailPresenterToInteractorProtocol? { get set }
    var router: TVShowDetailPresenterToRouterProtocol? { get set }
    
    var tvShowId: Int? { get set }
    
    func viewDidLoad()
    
}

// INTERACTOR -> PRESENTER
protocol TVShowDetailInteractorToPresenterProtocol {}

// MARK: - Interactor

// PRESENTER -> INTERACTOR
protocol TVShowDetailPresenterToInteractorProtocol {
    
    var presenter: TVShowDetailInteractorToPresenterProtocol? { get set }
    
    func fetchTVShowDetailById(_ tvShowId: Int)
    
}

// MARK: - Router

// PRESENTER -> ROUTER
protocol TVShowDetailPresenterToRouterProtocol {
    
    static func createModule(withTVShowId tvShowId: Int) -> UIViewController
    
}
