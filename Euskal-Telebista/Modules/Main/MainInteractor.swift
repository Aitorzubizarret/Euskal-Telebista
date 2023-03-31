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
    
}

// MARK: - MainPresenterToInteractorProtocol

extension MainInteractor: MainPresenterToInteractorProtocol {}
