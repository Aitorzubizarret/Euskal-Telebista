//
//  MainProtocols.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//  
//

import Foundation
import UIKit

// MARK: - View

// PRESENTER -> VIEW
protocol MainPresenterToViewProtocol: AnyObject {
    
    var presenter: MainViewToPresenterProtocol? { get set }
    
}

// MARK: - Presenter

// VIEW -> PRESENTER
protocol MainViewToPresenterProtocol: AnyObject {
    
    var view: MainPresenterToViewProtocol? { get set }
    var interactor: MainPresenterToInteractorProtocol? { get set }
    var router: MainPresenterToRouterProtocol? { get set }
    
    func viewDidLoad()
    
}

// INTERACTOR -> PRESENTER
protocol MainInteractorToPresenterProtocol: AnyObject {}

// MARK: - Interactor

// PRESENTER -> INTERACTOR
protocol MainPresenterToInteractorProtocol: AnyObject {
    
    var presenter: MainInteractorToPresenterProtocol? { get set }
    
}

// MARK: - Router

// PRESENTER -> ROUTER
protocol MainPresenterToRouterProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
}
