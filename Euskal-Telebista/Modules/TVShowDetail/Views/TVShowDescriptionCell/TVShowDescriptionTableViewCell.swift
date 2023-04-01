//
//  TVShowDescriptionTableViewCell.swift
//  Euskal-Telebista
//
//  Created by Aitor Zubizarreta on 2023-04-01.
//

import UIKit

class TVShowDescriptionTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tvShowDescriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var tvShowDescription: String = "" {
        didSet {
            tvShowDescriptionLabel.text = tvShowDescription
        }
    }
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
