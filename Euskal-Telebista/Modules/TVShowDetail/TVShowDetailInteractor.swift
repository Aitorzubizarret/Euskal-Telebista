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
    
    var selectedTVShowDetail: TVShowDetail?
    
}

// MARK: - TVShowDetail Presenter To InteractorProtocol

extension TVShowDetailInteractor: TVShowDetailPresenterToInteractorProtocol {
    
    func getTVShowDetailById(_ tvShowId: Int) {
        apiManager?.fetchTVShowDetailWithId(tvShowId: tvShowId)
    }
    
}

// MARK: - TVShowDetail APIManager To InteractorProtocol

extension TVShowDetailInteractor: TVShowDetailAPIManagerToInteractorProtocol {
    
    func fetchTVShowDetailSuccess(tvShow: TVShow, baseURL: String) {
        // TVShow Playlists IDs.
        let playlistsIDs: [Int] = tvShow.web_playlist.map { $0.ID }
        for playlistsID in playlistsIDs {
            apiManager?.fetchTVShowPlaylistWithId(tvShowPlaylistId: playlistsID)
        }
        
        // TVShow Main Info
        let name = tvShow.NOMBRE_GROUP
        let description = tvShow.SHORT_DESC
        // TODO: Category is missing.
        var image: URL? = nil
        if let imageData = tvShow.images.first {
            let imageString = baseURL + imageData.URL
            image = URL(string: imageString)
        }
        
        let tvShowDetail = TVShowDetail(name: name, category: "", description: description, image: image)
        
        selectedTVShowDetail = tvShowDetail
        
        presenter?.getTVShowDetailSuccess()
    }
    
    func fetchTVShowDetailFailure(errorDescription: String) {
        presenter?.getTVShowDetailFailure(errorDescription: errorDescription)
    }
    
}
