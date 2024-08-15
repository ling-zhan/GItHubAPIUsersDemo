//
//  EditView.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/15.
//

import UIKit

// MARK: - EditViewDelegate
protocol EditViewDelegate: AnyObject {
    func didTapCancelButton(editname: String)
    func closeEditView()
    
}

// MARK: - EditView
class EditView: UIView {
    
    static let identifier = "EditView"
    
    weak var delegate: EditViewDelegate?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var isConfirm: Bool = false
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }

        private func commonInit() {
            let nib = UINib(nibName: "EditView", bundle: nil)
            if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
                view.frame = self.bounds
                view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                self.addSubview(view)
            }
            self.accessibilityIdentifier = EditView.identifier
            
            // 設定模糊背景
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = self.backgroundView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.backgroundView.addSubview(blurEffectView)
            
            // contentView 圓角 12 點
            self.contentView.layer.cornerRadius = 12
            self.contentView.layer.masksToBounds = true
            
            // 設定點擊背景事件
            self.backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackgroundView(_:))))
        }
    
    /// 設定畫面內容
    func configureView(model: EditViewModel) {
        self.editTextField.text = model.username
    }
    
}

// MARK: - IBAction Methods & @objc Methods
extension EditView {
    /// 確認按鈕點擊事件
    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        self.isConfirm.toggle()
        self.delegate?.didTapCancelButton(editname: self.editTextField.text ?? "")
    }
    
    /// 取消按鈕點擊事件
    @IBAction func didTapCancelButton(_ sender: UIButton) {
        self.delegate?.closeEditView()
    }
    
    /// 點擊背景事件
    @objc func didTapBackgroundView(_ sender: UIButton) {
        self.delegate?.closeEditView()
    }
}
