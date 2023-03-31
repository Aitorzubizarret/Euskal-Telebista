//
//  MainProtocols.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//  
//

import Foundation
import UIKit

// MARK: - View

// PRESENTER -> VIEW
protocol MainPresenterToViewProtocol: AnyObject {
    
    var presenter: MainViewToPresenterProtocol? { get set }
    
    func onGetTVShowsSuccess()
    func onGetTVShowsFailure(errorDescription: String)
    
}

// MARK: - Presenter

// VIEW -> PRESENTER
protocol MainViewToPresenterProtocol: AnyObject {
    
    var view: MainPresenterToViewProtocol? { get set }
    var interactor: MainPresenterToInteractorProtocol? { get set }
    var router: MainPresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    
    func numberOfTVShows() -> Int
    func imageURLTVShowAt(_ row: Int) -> URL?
    func nameTVShowAt(_ row: Int) -> String
    
}

// INTERACTOR -> PRESENTER
protocol MainInteractorToPresenterProtocol: AnyObject {
    
    func getTVShowsSuccess()
    func getTVShowsFailure(errorDescription: String)
    
}

// MARK: - Interactor

// PRESENTER -> INTERACTOR
protocol MainPresenterToInteractorProtocol: AnyObject {
    
    var presenter: MainInteractorToPresenterProtocol? { get set }
    var apiManager: MainInteractorToAPIManagerProtocol? { get set }
    
    var tvShowsNamesImages: [TVShowNameImage] { get set }
    
    func getTVShows()
    
}

// APIMANAGER -> INTERACTOR
protocol MainAPIManagerToInteractorProtocol: AnyObject {
    
    func fetchTVShowsSuccess(tvShows: [TVShow], baseURL: String)
    func fetchTVShowsFailure(errorDescription: String)
    
}

// MARK: - Router

// PRESENTER -> ROUTER
protocol MainPresenterToRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
}

// MARK: - API Manager

// INTERACTOR -> API MANAGER
protocol MainInteractorToAPIManagerProtocol {
    
    var interactor: MainAPIManagerToInteractorProtocol? { get set }
    
    func fetchTVShows()
    
}
