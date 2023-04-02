//
//  TVShowCellTableViewCell.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-03-31.
//

import UIKit
import Kingfisher

class TVShowCellTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    var name: String = "" {
        didSet {
            nameLabel.text = name
        }
    }
    var imageURL: URL? = nil {
        didSet {
            guard let imageURL = imageURL else { return }
            
            coverImageView.kf.setImage(with: imageURL)
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
