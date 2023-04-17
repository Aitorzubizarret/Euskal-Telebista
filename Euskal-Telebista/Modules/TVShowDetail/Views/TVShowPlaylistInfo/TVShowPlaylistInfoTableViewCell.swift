//
//  TVShowPlaylistInfoTableViewCell.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-08.
//

import UIKit
import Kingfisher

class TVShowPlaylistInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataDurationLabel: UILabel!
    
    // MARK: - Properties
    
    var episodeName: String = "" {
        didSet {
            nameLabel.text = episodeName
        }
    }
    
    var episodeDataDuration: String = "" {
        didSet {
            dataDurationLabel.text = episodeDataDuration
        }
    }
    
    var episodeImageURL: URL? = nil {
        didSet {
            guard let episodeImageURL = episodeImageURL else { return }
            
            coverImageView.kf.setImage(with: episodeImageURL)
        }
    }
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        selectionStyle = .none
    }
    
}
