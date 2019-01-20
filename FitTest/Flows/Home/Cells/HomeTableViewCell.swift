//
//  HomeTableViewCell.swift
//  FitTest
//
//  Created by Pavel Borisov on 1/19/19.
//  Copyright © 2019 Pavel Borisov. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var entityTitleLabel: UILabel!
    @IBOutlet weak var entitySubTitleLabel: UILabel!
    @IBOutlet weak var entityAmountLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatarImageView.image = nil
    }
    
    // MARK: - Functions
    func configure(with entity: EntityModel) {
        self.avatarImageView.image = nil
        // TODO: Consider adding placeholder image here
        if let image = entity.image {
            self.avatarImageView.image = image
        }
        
        self.entityTitleLabel.text = entity.title?.capitalized ?? ""
        self.entitySubTitleLabel.text = entity.subtitle?.capitalized ?? ""
        self.entityAmountLabel.text = "\(entity.amount ?? 0)"
    }
}
