//
//  TVShowDetailInteractor.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//  
//

import Foundation

class TVShowDetailInteractor {

    // MARK: - Properties (from TVShowDetailPresenterToInteractorProtocol)
    
    var presenter: TVShowDetailInteractorToPresenterProtocol?
    var apiManager: TVShowDetailInteractorToAPIManagerProtocol?
    
}

// MARK: - TVShowDetailPresenterToInteractorProtocol

extension TVShowDetailInteractor: TVShowDetailPresenterToInteractorProtocol {
    
    func getTVShowDetailById(_ tvShowId: Int) {
        apiManager?.fetchTVShowDetailWithId(tvShowId: tvShowId)
    }
    
}
