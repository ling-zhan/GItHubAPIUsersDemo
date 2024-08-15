//
//  UserTableViewCell.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var siteAdminLabel: UILabel!
    @IBOutlet weak var indexView: UIView!
    @IBOutlet weak var indexLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 頭像圓角
        avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
        avatarView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        
        // indexView 8 點圓角
        indexView.layer.cornerRadius = 8
        indexView.layer.masksToBounds = true
    }
    
    func configureCell(user: GitHubUser, index: Int) {
        indexLabel.text = "\(index)"
        loginLabel.text = user.login
        siteAdminLabel.text = user.siteAdmin ? "Site Admin 🔰" : ""
        
        // 設定頭像
        if let url = URL(string: user.avatarURL) {
            HttpManager.shared.loadImage(url: url) { data in
                if let data = data {
                    DispatchQueue.main.async {
                        self.avatarImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
