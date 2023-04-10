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
    
    func onGetTVShowDetailSuccess()
    func onGetTVShowDetailFailure(errorDescription: String)
    func onGetTVShowPlaylistSuccess()
    func onGetTVShowPlaylistFailure(errorDescription: String)
    
}

// MARK: - Presenter

// VIEW -> PRESENTER
protocol TVShowDetailViewToPresenterProtocol {
    
    var view: TVShowDetailPresenterToViewProtocol? { get set }
    var interactor: TVShowDetailPresenterToInteractorProtocol? { get set }
    var router: TVShowDetailPresenterToRouterProtocol? { get set }
    
    var tvShowId: Int? { get set }
    
    func viewDidLoad()
    
    func numberOfSections() -> Int
    func titleForHeaderInSection(section: Int) -> String
    func numberOfRowsInSection(section: Int) -> Int
    
    func tvShowImage() -> URL?
    func tvShowName() -> String
    func tvShowDescription() -> String
    
    func episodeName(section: Int, row: Int) -> String
    func episodeImage(section: Int, row: Int) -> URL?
    
}

// INTERACTOR -> PRESENTER
protocol TVShowDetailInteractorToPresenterProtocol {
    
    func getTVShowDetailSuccess()
    func getTVShowDetailFailure(errorDescription: String)
    func getTVShowPlaylistSuccess()
    func getTVShowPlaylistFailure(errorDescription: String)
    
}

// MARK: - Interactor

// PRESENTER -> INTERACTOR
protocol TVShowDetailPresenterToInteractorProtocol {
    
    var presenter: TVShowDetailInteractorToPresenterProtocol? { get set }
    var apiManager: TVShowDetailInteractorToAPIManagerProtocol? { get set }
    
    var selectedTVShowDetail: TVShowDetail? { get set }
    var selectedTVShowPlaylists: [TVShowPlaylist] { get set }
    
    func getTVShowDetailById(_ tvShowId: Int)
    
}

// API MANAGER -> INTERACTOR
protocol TVShowDetailAPIManagerToInteractorProtocol {
    
    func fetchTVShowDetailSuccess(tvShow: TVShow, baseURL: String)
    func fetchTVShowDetailFailure(errorDescription: String)
    func fetchTVShowPlaylistSuccess(tvShowPlaylistResponse: TVShowPlaylistResponse)
    func fetchTVShowPlaylistFailure(errorDescription: String)
    
}

// MARK: - Router

// PRESENTER -> ROUTER
protocol TVShowDetailPresenterToRouterProtocol {
    
    static func createModule(withTVShowId tvShowId: Int) -> UIViewController
    
}

// MARK: - API Manager

// INTERACTOR -> API MANAGER
protocol TVShowDetailInteractorToAPIManagerProtocol {
    
    var interactorTVShowDetail: TVShowDetailAPIManagerToInteractorProtocol? { get set }
    
    func fetchTVShowDetailWithId(tvShowId: Int)
    func fetchTVShowPlaylistWithId(tvShowPlaylistId: Int)
    
}
