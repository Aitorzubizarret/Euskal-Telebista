//
//  MainView.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//  
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties (from MainPresenterToViewProtocol)
    
    var presenter: MainViewToPresenterProtocol?

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

// MARK: - MainPresenterToViewProtocol

extension MainViewController: MainPresenterToViewProtocol {}
