//
//  IconLabelTableViewCell.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/15.
//

import UIKit

class IconLabelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: IconLabelTableViewCellModel) {
        self.iconImageView.image = UIImage(systemName: model.iconName)
        self.titleLabel.text = model.title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
