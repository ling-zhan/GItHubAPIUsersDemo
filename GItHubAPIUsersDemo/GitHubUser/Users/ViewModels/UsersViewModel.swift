//
//  UsersViewModel.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import Foundation

// MARK: - UsersViewModelDelegate
protocol UsersViewModelDelegate: AnyObject {
    func getUsersSuccess()
    func getUsersFailure()
}

// MARK: - UsersViewModel
class UsersViewModel {
    
    weak var delegate: UsersViewModelDelegate?
    
    // 使用者列表起始值
    var since: Int = 0
    
    // 使用者列表
    var users:[GitHubUser] = []
    
    // mock data
//     var users:[GitHubUser] = [GitHubUser.mockGitHubUser]
    
    // 錯誤訊息
    var message: String = ""

}

// MARK - Public methods
extension UsersViewModel {
    
    /// 檢查是否需要載入更多
    func checkIfNeedLoadMore() -> Bool {
        if isSinceMaximum() {
            return false
        } else {
            if isResidualZero() {
                return true
            }
            return false
        }
    }
    
    /// 是否已經達到最大值
    func isSinceMaximum() -> Bool {
        return self.since == 100
    }
    
    /// 是否為 20 的倍數
    func isResidualZero() -> Bool {
        return self.since % 20 == 0
    }
}

// MARK - API
extension UsersViewModel {
    
    /// 獲取 GitHub 使用者列表
    func getGitHubUsers() {
        HttpManager.shared.getGitHubUsers(
            since: since,
            success: { users in
                if let users = users {
                    
                    self.users.append(contentsOf: users)
                    self.since = self.users.count
                    self.delegate?.getUsersSuccess()
                }
            }, failure: { [self] error in
                if let error = error {
                    self.message = error.localizedDescription
                    delegate?.getUsersFailure()
                }
            })
    }
}
