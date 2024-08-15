//
//  DividerTableViewCell.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/15.
//

import UIKit

class DividerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dividerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // 設定 cell 內容
    func configureCell(model: DividerTableViewCellModel) {
        self.dividerView.backgroundColor = model.dividerColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
