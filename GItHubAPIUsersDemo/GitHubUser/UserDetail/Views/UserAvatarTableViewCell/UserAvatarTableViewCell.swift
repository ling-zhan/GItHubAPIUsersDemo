//
//  UserAvatarTableViewCell.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import UIKit

//MARK: - UserAvatarTableViewCellDelegate
protocol UserAvatarTableViewCellDelegate: AnyObject {
    func closeTapped()
    func editTapped()
}

//MARK: - UserAvatarTableViewCell
class UserAvatarTableViewCell: UITableViewCell {
    
    weak var delegate: UserAvatarTableViewCellDelegate?
    
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var siteAdminLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        avatarView.layer.cornerRadius = avatarView.frame.size.width / 2
        avatarView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        
        // closeImageView add tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeTapped))
        self.closeImageView.addGestureRecognizer(tap)
        self.closeImageView.isUserInteractionEnabled = true
        

        self.editButton.layer.cornerRadius = 8
        self.editButton.isUserInteractionEnabled = true
        
    }
    
    
    /// Configure cell
    func configureCell(model: UserAvatarTableViewCellModel) {
        
        self.loginLabel.text = model.login
        self.nameLabel.text = model.name
        
        self.siteAdminLabel.isHidden = model.siteAdmin ? false : true
        
        // 設定頭像
        if let url = URL(string: model.avatarURL) {
            HttpManager.shared.loadImage(url: url) { data in
                if let data = data {
                    DispatchQueue.main.async {
                        self.avatarImageView.image = UIImage(data: data)
                    }
                }
            }
        }

    }
    
    /// 返回上一頁點擊事件
    @objc func closeTapped() {
        self.delegate?.closeTapped()
    }
    
    /// 編輯按鈕點擊事件
    @IBAction func editButtonTapped(_ sender: Any) {
        self.delegate?.editTapped()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
