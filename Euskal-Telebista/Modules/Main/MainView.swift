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
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - Properties (from MainPresenterToViewProtocol)
    
    var presenter: MainViewToPresenterProtocol?
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
        // Appearance
        tableview.separatorStyle = .none
        
        // Register the cell.
        let tvShowCell = UINib(nibName: "TVShowCellTableViewCell", bundle: nil)
        tableview.register(tvShowCell, forCellReuseIdentifier: "TVShowCellTableViewCell")
    }
    
}

// MARK: - UITableView Delegate

extension MainViewController: UITableViewDelegate {}

// MARK: - UITableView Data Source

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfTVShows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCellTableViewCell", for: indexPath) as! TVShowCellTableViewCell
        cell.imageURL = presenter?.imageURLTVShowAt(indexPath.row)
        cell.name = presenter?.nameTVShowAt(indexPath.row) ?? ""
        return cell
    }
    
}

// MARK: - MainPresenterToViewProtocol

extension MainViewController: MainPresenterToViewProtocol {
    
    func onGetTVShowsSuccess() {
        DispatchQueue.main.async { [weak self] in
            self?.tableview.reloadData()
        }
    }
    
    func onGetTVShowsFailure(errorDescription: String) {
        print(errorDescription)
        // TODO: Do something with this.
    }
    
}
