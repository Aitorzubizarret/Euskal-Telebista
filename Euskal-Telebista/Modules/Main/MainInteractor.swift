//
//  MainInteractor.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//  
//

import Foundation

class MainInteractor {

    // MARK: - Properties (from MainPresenterToInteractorProtocol)
    
    var presenter: MainInteractorToPresenterProtocol?
    var apiManager: MainInteractorToAPIManagerProtocol?
    
    var tvShowsNames: [String] = [] {
        didSet {
            presenter?.getTVShowsSuccess()
        }
    }
}

// MARK: - MainPresenterToInteractorProtocol

extension MainInteractor: MainPresenterToInteractorProtocol {
    
    func getTVShows() {
        apiManager?.fetchTVShows()
    }
    
}

extension MainInteractor: MainAPIManagerToInteractorProtocol {
    
    func fetchTVShowsSuccess(tvShows: [TVShow]) {
        tvShowsNames = tvShows.map {$0.NOMBRE_GROUP}
    }
    
    func fetchTVShowsFailure(errorDescription: String) {
        presenter?.getTVShowsFailure(errorDescription: errorDescription)
    }
    
}
