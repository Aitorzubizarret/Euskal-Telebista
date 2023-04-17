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
    
    func numberOfSections() -> Int {
        if let numberOfPlaylists = interactor?.selectedTVShowPlaylists.count {
            return 1 + numberOfPlaylists
        } else {
            return 1
        }
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        if section > 0,
           let sectionName = interactor?.selectedTVShowPlaylists[section - 1].title_EU {
            return sectionName
        } else {
            return ""
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return interactor?.selectedTVShowPlaylists[section - 1].episodes.count ?? 0
        }
    }
    
    func tvShowImage() -> URL? {
        guard let selectedTVShow = interactor?.selectedTVShowDetail else { return nil }
        
        return selectedTVShow.image
    }
    
    func tvShowName() -> String {
        guard let selectedTVShow = interactor?.selectedTVShowDetail else { return "" }
        
        return selectedTVShow.name
    }
    
    func tvShowDescription() -> String {
        guard let selectedTVShow = interactor?.selectedTVShowDetail else { return "" }
        
        return selectedTVShow.description
    }
    
    func episodeName(section: Int, row: Int) -> String {
        return interactor?.selectedTVShowPlaylists[section - 1].episodes[row].title_EU ?? ""
    }
    
    func episodeImage(section: Int, row: Int) -> URL? {
        return interactor?.selectedTVShowPlaylists[section - 1].episodes[row].imageURL
    }
    
    func didSelectRowAt(atIndexPath: IndexPath) {
        
        let section = atIndexPath.section - 1
        let row = atIndexPath.row
        
        guard let videoIdString = interactor?.selectedTVShowPlaylists[section].episodes[row].id,
              let videoId: Int = Int(videoIdString) else { return }
        
        interactor?.getTVShowVideoById(videoId)
    }
    
    func openVideoPlayer() {
        guard let view = view,
              let selectedVideoSource = interactor?.selectedTVShowVideoSource,
              let selectedVideoSourceURL = URL(string: selectedVideoSource.PMD_URL) else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.router?.openVideoPlayer(on: view, videoURL: selectedVideoSourceURL)
        }
        
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
    
    func getTVShowPlaylistSuccess() {
        view?.onGetTVShowPlaylistSuccess()
    }
    
    func getTVShowPlaylistFailure(errorDescription: String) {
        view?.onGetTVShowPlaylistFailure(errorDescription: errorDescription)
    }
    
    func getTVShowVideoSuccess() {
        view?.onGetTVShowVideoSuccess()
    }
    
}
