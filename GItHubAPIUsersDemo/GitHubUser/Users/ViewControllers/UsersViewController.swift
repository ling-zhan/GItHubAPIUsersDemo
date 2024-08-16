//
//  UsersViewController.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = UsersViewModel()
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.fetchUsers()
    }
}

// MARK - Private methods
extension UsersViewController {
    private func setupUI() {
        self.title = "GitHub Users"
        
        self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        self.viewModel.delegate = self
    }
    
    private func fetchUsers() {
        self.viewModel.getGitHubUsers()
        self.activityIndicator.isHidden = false
    }
    
    private func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height - 100, width: 200, height: 45))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.numberOfLines = 0
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

// MARK - UsersViewModelDelegate
extension UsersViewController: UsersViewModelDelegate {
    func getUsersSuccess() {
        self.tableView.reloadData()
        self.activityIndicator.isHidden = true
    }
    
    func getUsersFailure() {
        self.activityIndicator.isHidden = true
        self.showToast(message: viewModel.message, font: UIFont.systemFont(ofSize: 12))
    }
}

// MARK - UITableViewDelegate、UITableViewDataSource
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.configureCell(user: self.viewModel.users[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 推到下一頁
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userVC = storyboard.instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
        userVC.viewModel = UserDetailViewModel()
        userVC.viewModel.username = self.viewModel.users[indexPath.row].login
        self.navigationController?.pushViewController(userVC, animated: true)

    }
    
    // 滑到最後一筆資料時更新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.row == self.viewModel.users.count - 1 {
            if self.viewModel.checkIfNeedLoadMore() {
                self.fetchUsers()
            }else {
                return
            }
        }
    }
}
