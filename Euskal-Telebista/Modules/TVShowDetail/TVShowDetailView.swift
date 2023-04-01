//
//  TVShowDetailView.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//  
//

import Foundation
import UIKit

class TVShowDetailViewController: UIViewController {

    // MARK: - Properties (from TVShowDetailPresenterToViewProtocol)
    
    var presenter: TVShowDetailViewToPresenterProtocol?

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - TVShowDetailPresenterToViewProtocol

extension TVShowDetailViewController: TVShowDetailPresenterToViewProtocol {}
