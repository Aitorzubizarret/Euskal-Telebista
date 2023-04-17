//
//  TVShowMainInfoTableViewCell.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-02.
//

import UIKit
import Kingfisher

class TVShowMainInfoTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tvShowCoverImageView: UIImageView!
    @IBOutlet weak var tvShowNameLabel: UILabel!
    @IBOutlet weak var tvShowDescriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var tvShowImage: URL? = nil {
        didSet {
            guard let tvShowImage = tvShowImage else { return }
            
            tvShowCoverImageView.kf.setImage(with: tvShowImage)
        }
    }
    var tvShowName: String = "" {
        didSet {
            tvShowNameLabel.text = tvShowName
        }
    }
    var tvShowDescription: String = "" {
        didSet {
            tvShowDescriptionLabel.text = tvShowDescription
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
