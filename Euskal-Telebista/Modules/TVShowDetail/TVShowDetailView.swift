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
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties (from TVShowDetailPresenterToViewProtocol)
    
    var presenter: TVShowDetailViewToPresenterProtocol?

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Appearance.
        tableView.separatorStyle = .none
        
        // Register the cell.
        let tvShowDescriptionCell = UINib(nibName: "TVShowDescriptionTableViewCell", bundle: nil)
        tableView.register(tvShowDescriptionCell, forCellReuseIdentifier: "TVShowDescriptionTableViewCell")
    }
}

// MARK: - UITableView Delegate

extension TVShowDetailViewController: UITableViewDelegate {}

// MARK: - UITableView Data Source

extension TVShowDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowDescriptionTableViewCell", for: indexPath) as! TVShowDescriptionTableViewCell
        cell.tvShowDescription = "Temporary TV Show description text."
        return cell
    }
    
}

// MARK: - TVShowDetailPresenterToViewProtocol

extension TVShowDetailViewController: TVShowDetailPresenterToViewProtocol {}
