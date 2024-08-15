//
//  LongTextTableViewCell.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/15.
//

import UIKit

class LongTextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // textView 圓角 12點
        self.textView.layer.cornerRadius = 12
        // textView 邊框 1點
        self.textView.layer.borderWidth = 1
        // textView 邊框顏色 灰色
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.textView.layer.masksToBounds = true
        
    }
    
    // 設定 cell 內容
    func configureCell(model: LongTextTableViewCellModel) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        // 行間距 4點
        paragraphStyle.lineSpacing = 4
        // 對齊方式 左右對齊
        paragraphStyle.alignment = .justified

        let attributedText = NSMutableAttributedString(
            string: model.text,
            attributes: [
                .paragraphStyle: paragraphStyle
            ]
        )
        
        self.contentLabel.attributedText = attributedText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
