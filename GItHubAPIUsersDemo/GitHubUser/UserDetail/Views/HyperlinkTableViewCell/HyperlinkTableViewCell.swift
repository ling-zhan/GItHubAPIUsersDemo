//
//  HyperlinkTableViewCell.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/15.
//

import UIKit

class HyperlinkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hyperlinkLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: HyperlinkTableViewCellModel) {
        
        self.titleLabel.text = model.title
        
        let attributedString = NSMutableAttributedString(string: model.url)

        // 設置超連結範圍
        let linkRange = (attributedString.string as NSString).range(of: model.url)
        attributedString.addAttribute(.link, value: model.url, range: linkRange)

        // 設置其他樣式
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: linkRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: linkRange)

        self.hyperlinkLabel.attributedText = attributedString
        self.hyperlinkLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openHyperlink))
        self.hyperlinkLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func openHyperlink() {
        if let url = URL(string: self.hyperlinkLabel.text ?? "") {
            UIApplication.shared.open(url)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
