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
}

// MARK: - MainPresenterToInteractorProtocol

extension MainInteractor: MainPresenterToInteractorProtocol {
    
    func getTVShows() {
        apiManager?.fetchTVShows()
    }
    
}

extension MainInteractor: MainAPIManagerToInteractorProtocol {
    
    func fetchTVShowsSuccess() {
        print("fetchTVShowsSuccess")
    }
    
    func fetchTVShowsFailure() {
        print("")
    }
    
}
