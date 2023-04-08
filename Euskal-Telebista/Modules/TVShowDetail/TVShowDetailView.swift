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
        let tvShowDescriptionCell = UINib(nibName: "TVShowMainInfoTableViewCell", bundle: nil)
        tableView.register(tvShowDescriptionCell, forCellReuseIdentifier: "TVShowMainInfoTableViewCell")
        
        let tvShowPlaylistEpisodeCell = UINib(nibName: "TVShowPlaylistInfoTableViewCell", bundle: nil)
        tableView.register(tvShowPlaylistEpisodeCell, forCellReuseIdentifier: "TVShowPlaylistInfoTableViewCell")
    }
}

// MARK: - UITableView Delegate

extension TVShowDetailViewController: UITableViewDelegate {}

// MARK: - UITableView Data Source

extension TVShowDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Detail info + Playlist
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowMainInfoTableViewCell", for: indexPath) as! TVShowMainInfoTableViewCell
            cell.tvShowImage = presenter?.tvShowImage()
            cell.tvShowName = presenter?.tvShowName() ?? ""
            cell.tvShowDescription = presenter?.tvShowDescription() ?? ""
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowPlaylistInfoTableViewCell", for: indexPath) as! TVShowPlaylistInfoTableViewCell
            return cell
            
        }
        
    }
    
}

// MARK: - TVShowDetailPresenterToViewProtocol

extension TVShowDetailViewController: TVShowDetailPresenterToViewProtocol {
    
    func onGetTVShowDetailSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func onGetTVShowDetailFailure(errorDescription: String) {
        print(errorDescription)
    }
    
}
