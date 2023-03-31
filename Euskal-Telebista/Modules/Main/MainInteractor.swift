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
    
    var tvShowsNamesImages: [TVShowNameImage] = [] {
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
        tvShowsNamesImages = tvShows.map {
            let name: String = $0.NOMBRE_GROUP
            if let image = $0.images.first {
                let urlString: String = baseURL + image.URL
                return TVShowNameImage(name: name, image: URL(string: urlString))
            } else {
                return TVShowNameImage(name: name, image: nil)
            }
        }
    }
    
    func fetchTVShowsFailure(errorDescription: String) {
        presenter?.getTVShowsFailure(errorDescription: errorDescription)
    }
    
}
