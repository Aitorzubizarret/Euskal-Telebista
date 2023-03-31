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
    
}

// MARK: - MainInteractorToPresenterProtocol

extension MainPresenter: MainInteractorToPresenterProtocol {
    
}
