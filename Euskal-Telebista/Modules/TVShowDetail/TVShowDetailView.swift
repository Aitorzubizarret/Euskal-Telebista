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

extension TVShowDetailViewController: UITableViewDelegate {
    
    // TODO: viewForHeaderInSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter?.titleForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            presenter?.didSelectRowAt(atIndexPath: indexPath)
        }
    }
    
}

// MARK: - UITableView Data Source

extension TVShowDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 0
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
            cell.episodeName = presenter?.episodeName(section: indexPath.section, row: indexPath.row) ?? ""
            cell.episodeImageURL = presenter?.episodeImage(section: indexPath.section, row: indexPath.row)
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
    
    func onGetTVShowPlaylistSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func onGetTVShowPlaylistFailure(errorDescription: String) {
        print(errorDescription)
    }
    
    func onGetTVShowVideoSuccess() {
        presenter?.openVideoPlayer()
    }
    
    func onGetTVShowVideoFailure(errorDescription: String) {
        print(errorDescription)
    }
    
}
