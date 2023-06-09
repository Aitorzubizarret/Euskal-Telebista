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
    
    weak var presenter: MainInteractorToPresenterProtocol?
    var apiManager: MainInteractorToAPIManagerProtocol?
    
    var tvShowsInfo: [TVShowInfo] = [] {
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
    
    func fetchTVShowsSuccess(tvShows: [TVShow], baseURL: String) {
        let orderedTVShows = orderTVShowsAlphabetically(tvShows: tvShows)
        
        tvShowsInfo = orderedTVShows.map {
            let id: Int = $0.ID_WEB_GROUP
            let name: String = $0.NOMBRE_GROUP
            if let image = $0.images.first {
                let urlString: String = baseURL + image.URL
                return TVShowInfo(id: id, name: name, image: URL(string: urlString))
            } else {
                return TVShowInfo(id: id, name: name, image: nil)
            }
        }
    }
    
    func fetchTVShowsFailure(errorDescription: String) {
        presenter?.getTVShowsFailure(errorDescription: errorDescription)
    }
    
    func orderTVShowsAlphabetically(tvShows: [TVShow]) -> [TVShow] {
        return tvShows.sorted {$0.NOMBRE_GROUP <= $1.NOMBRE_GROUP}
    }
    
}
