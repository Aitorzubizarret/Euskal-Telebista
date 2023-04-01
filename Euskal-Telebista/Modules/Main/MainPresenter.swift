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
    
    func didSelectTVShowsAt(_ row: Int) {
        guard let view = view,
              let tvShowNamesImages = interactor?.tvShowsInfo else { return }
        
        let tvShowId: Int = tvShowNamesImages[row].id
        
        router?.showTVShowDetail(on: view, tvShowId: tvShowId)
    }
    
    func numberOfTVShows() -> Int {
        return interactor?.tvShowsInfo.count ?? 0
    }
    
    func imageURLTVShowAt(_ row: Int) -> URL? {
        return interactor?.tvShowsInfo[row].image
    }
    
    func nameTVShowAt(_ row: Int) -> String {
        return interactor?.tvShowsInfo[row].name ?? ""
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
