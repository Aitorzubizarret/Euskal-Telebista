//
//  MainPresenter.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//  
//

import Foundation

class MainPresenter  {
    
    // MARK: - Properties (from MainViewToPresenterProtocol)
    
    weak var view: MainPresenterToViewProtocol?
    var interactor: MainPresenterToInteractorProtocol?
    var router: MainPresenterToRouterProtocol?
    
}

// MARK: - MainViewToPresenterProtocol

extension MainPresenter: MainViewToPresenterProtocol {
    
    func viewDidLoad() {
        interactor?.getTVShows()
    }
    
    func numberOfTVShows() -> Int {
        return interactor?.tvShowsNamesImages.count ?? 0
    }
    
    func imageURLTVShowAt(_ row: Int) -> URL? {
        return interactor?.tvShowsNamesImages[row].image
    }
    
    func nameTVShowAt(_ row: Int) -> String {
        return interactor?.tvShowsNamesImages[row].name ?? ""
    }
    
}

// MARK: - MainInteractorToPresenterProtocol

extension MainPresenter: MainInteractorToPresenterProtocol {
    
    func getTVShowsSuccess() {
        view?.onGetTVShowsSuccess()
    }
    
    func getTVShowsFailure(errorDescription: String) {
        view?.onGetTVShowsFailure(errorDescription: errorDescription)
    }
}
