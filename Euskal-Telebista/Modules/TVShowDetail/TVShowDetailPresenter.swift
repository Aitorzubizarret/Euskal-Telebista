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
    
}

// MARK: - TVShowDetailViewToPresenterProtocol

extension TVShowDetailPresenter: TVShowDetailViewToPresenterProtocol {
    
    func viewDidLoad() {}
    
}

// MARK: - TVShowDetailInteractorToPresenterProtocol

extension TVShowDetailPresenter: TVShowDetailInteractorToPresenterProtocol {}
