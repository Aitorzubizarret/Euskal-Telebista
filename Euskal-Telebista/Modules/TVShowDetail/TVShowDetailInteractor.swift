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
    
}

// MARK: - TVShowDetailPresenterToInteractorProtocol

extension TVShowDetailInteractor: TVShowDetailPresenterToInteractorProtocol {}
