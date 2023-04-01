//
//  TVShowDetailPresenter.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//  
//

import Foundation

class TVShowDetailPresenter  {
    
    // MARK: - Properties (from TVShowDetailViewToPresenterProtocol)
    
    var view: TVShowDetailPresenterToViewProtocol?
    var interactor: TVShowDetailPresenterToInteractorProtocol?
    var router: TVShowDetailPresenterToRouterProtocol?
    
    var tvShowId: Int? = nil
    
}

// MARK: - TVShowDetailViewToPresenterProtocol

extension TVShowDetailPresenter: TVShowDetailViewToPresenterProtocol {
    
    func viewDidLoad() {
        guard let tvShowId = tvShowId else { return }
        
        interactor?.getTVShowDetailById(tvShowId)
    }
    
    func tvShowName() -> String {
        guard let selectedTVShow = interactor?.selectedTVShowDetail else { return "" }
        
        return selectedTVShow.name
    }
    
    func tvShowDescription() -> String {
        guard let selectedTVShow = interactor?.selectedTVShowDetail else { return "" }
        
        return selectedTVShow.description
    }
    
}

// MARK: - TVShowDetailInteractorToPresenterProtocol

extension TVShowDetailPresenter: TVShowDetailInteractorToPresenterProtocol {
    
    func getTVShowDetailSuccess() {
        view?.onGetTVShowDetailSuccess()
    }
    
    func getTVShowDetailFailure(errorDescription: String) {
        view?.onGetTVShowDetailFailure(errorDescription: errorDescription)
    }
    
}
