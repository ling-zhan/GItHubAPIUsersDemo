//
//  UserDetailViewController.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = UserDetailViewModel()
    let editView = EditView()
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // hide navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.fetchUserDetail()
    }
    
}

// MARK - Private methods
extension UserDetailViewController {
    
    /// 初始化 UI 設定
    private func setupUI() {
        self.viewModel.delegate = self
        
        
        // tableView 自動調整高度
        tableView.rowHeight = UITableView.automaticDimension
        
        
        self.tableView.register(UINib(nibName: "UserAvatarTableViewCell", bundle: nil), forCellReuseIdentifier: "UserAvatarTableViewCell")
        self.tableView.register(UINib(nibName: "IconLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "IconLabelTableViewCell")
        self.tableView.register(UINib(nibName: "HyperlinkTableViewCell", bundle: nil), forCellReuseIdentifier: "HyperlinkTableViewCell")
        self.tableView.register(UINib(nibName: "DividerTableViewCell", bundle: nil), forCellReuseIdentifier: "DividerTableViewCell")
        self.tableView.register(UINib(nibName: "LongTextTableViewCell", bundle: nil), forCellReuseIdentifier: "LongTextTableViewCell")
        
    }
    
    // 獲取使用者詳細資料
    private func fetchUserDetail() {
        self.viewModel.getUserDetail()
        self.activityIndicator.isHidden = false
    }
    
    // 顯示 alert 訊息
    func showErrorAlert(message : String) {
        let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            // 返回上一頁
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}


// MARK: - EditView
extension UserDetailViewController {
    private func showEditView() {
        self.editView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        self.editView.alpha = 0
        view.addSubview(self.editView)
        
        self.editView.delegate = self
        
        let model = EditViewModel()
        model.username = self.viewModel.user?.name ?? ""
        
        self.editView.configureView(model: model)
        
        UIView.animate(withDuration: 0.3) {
            self.editView.alpha = 1
        }
    }
    
    private func hideEditView() {
        for subview in view.subviews {
            if subview.accessibilityIdentifier == EditView.identifier {
                UIView.animate(withDuration: 0.3, animations: {
                    subview.alpha = 0
                }) { _ in
                    subview.removeFromSuperview()
                }
                break
            }
        }
    }
}

// MARK: - UserDetailViewModelDelegate
extension UserDetailViewController: UserDetailViewModelDelegate {
    func getUserDetailSuccess() {
        // rebuild cell models
        self.viewModel.buildCellModels()
        // reload tableView
        self.tableView.reloadData()
        self.activityIndicator.isHidden = true
    }
    
    func getUserDetailFailure() {
        // Show error message
        self.activityIndicator.isHidden = true
        self.showErrorAlert(message: self.viewModel.message)
    }
}

extension UserDetailViewController: EditViewDelegate {
    func didTapCancelButton(editname: String) {
        // 更新使用者名稱
        self.viewModel.user?.name = editname
        
        // rebuild cell models
        self.viewModel.buildCellModels()

        // 關掉編輯畫面
        hideEditView()
        
        // reload tableView
        self.tableView.reloadData()
    }
    
    func closeEditView() {
        // 關掉編輯畫面
        hideEditView()
    }
}

// MARK: - UITableViewDataSource
extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType = self.viewModel.cellModels[indexPath.row].type
        
        switch cellType {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserAvatarTableViewCell", for: indexPath) as! UserAvatarTableViewCell
            
            let model = self.viewModel.cellModels[indexPath.row].model as! UserAvatarTableViewCellModel
            
            cell.delegate = self
            cell.configureCell(model: model)
            
            return cell
        case .blog:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HyperlinkTableViewCell", for: indexPath) as! HyperlinkTableViewCell
            
            let model = self.viewModel.cellModels[indexPath.row].model as! HyperlinkTableViewCellModel
            
            cell.configureCell(model: model)
            
            return cell
            
        case .bio:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LongTextTableViewCell", for: indexPath) as! LongTextTableViewCell
            
            let model = self.viewModel.cellModels[indexPath.row].model as! LongTextTableViewCellModel
            
            cell.configureCell(model: model)
            
            return cell
        case .location:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IconLabelTableViewCell", for: indexPath) as! IconLabelTableViewCell
            
            let model = self.viewModel.cellModels[indexPath.row].model as! IconLabelTableViewCellModel
            
            cell.configureCell(model: model)
            
            return cell
            
        case .divider:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DividerTableViewCell", for: indexPath) as! DividerTableViewCell
            
            let model = self.viewModel.cellModels[indexPath.row].model as! DividerTableViewCellModel
            
            cell.configureCell(model: model)
            
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension UserDetailViewController: UserAvatarTableViewCellDelegate {
    func editTapped() {
        // 顯示編輯畫面
        self.showEditView()
    }
    
    func closeTapped() {
        // 返回上一頁
        self.navigationController?.popViewController(animated: true)
    }
}
