//
//  UserDetailViewModel.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import Foundation

//MARK: - UserDetailCellType
enum UserDetailCellType {
    // 頭像
    case avatar
    // 地點
    case location
    // 部落格
    case blog
    // 簡介
    case bio
    // 分隔線
    case divider
    
}

//MARK: - UserDetailCellModel
struct UserDetailCellModel {
    // Cell 類別
    var type: UserDetailCellType
    // Cell Model
    var model: Any?
}

//MARK: - UserDetailViewModelDelegate
protocol UserDetailViewModelDelegate: AnyObject {
    // 獲取使用者資料成功
    func getUserDetailSuccess()
    // 獲取使用者資料失敗
    func getUserDetailFailure()
}

//MARK: - UserDetailViewModel
class UserDetailViewModel {
    
    weak var delegate: UserDetailViewModelDelegate?
    
    // 使用者名稱
    var username: String = ""
    // 使用者資料
    var user: GitHubDetailUser?
    
    // mock data
    // var user: GitHubDetailUser? = GitHubDetailUser.mockGitHubDetailUser
    
    // 錯誤訊息
    var message: String = ""
    
    // Cell 的 Model 陣列
    private(set) var cellModels: [UserDetailCellModel] = []
    
    init() {
        self.buildCellModels()
    }
    
}

// MARK: - Build cell models
extension UserDetailViewModel {
    
    /// 創建 Cell Model 陣列
    func buildCellModels() {
        self.cellModels.removeAll()
        self.cellModels.append(self.createViewModel(.avatar))
        self.cellModels.append(self.createViewModel(.bio))
        self.cellModels.append(self.createViewModel(.divider))
        self.cellModels.append(self.createViewModel(.location))
        self.cellModels.append(self.createViewModel(.blog))
    }
    
    /// 創建 Cell Model
    func createViewModel(_ cellType: UserDetailCellType) -> UserDetailCellModel {
        let model: Any
        switch cellType {
        case .avatar:
            let cellModel = UserAvatarTableViewCellModel()
            
            cellModel.avatarURL = self.user?.avatarURL ?? ""
            cellModel.login = self.user?.login ?? ""
            cellModel.name = self.user?.name ?? ""
            cellModel.siteAdmin = self.user?.siteAdmin ?? false
            
            model = cellModel
            
        case .location:
            let cellModel = IconLabelTableViewCellModel()
            cellModel.iconName = "location.fill"
            cellModel.title = self.user?.location ?? "Information not provided."
            
            model = cellModel
            
        case .blog:
            let cellModel = HyperlinkTableViewCellModel()
            cellModel.title = "Blog"
            cellModel.url = self.user?.blog ?? ""
            
            model = cellModel
            
        case .bio:
            let cellModel = LongTextTableViewCellModel()
            cellModel.text = self.user?.bio ?? "Oops... nothing any more."
            
            model = cellModel
            
        case .divider:
            let cellModel = DividerTableViewCellModel()
            model = cellModel
        }
        
        return UserDetailCellModel(type: cellType, model: model)
    }
}

// MARK: - API
extension UserDetailViewModel {
    
    /// 取得使用者詳細資料
    func getUserDetail() {
        HttpManager.shared.getGitHubUserDetail(username: self.username, success: { user in
            if let user = user {
                self.user = user
                self.delegate?.getUserDetailSuccess()
            } else {
                self.delegate?.getUserDetailFailure()
            }
        }, failure: { error in
            self.delegate?.getUserDetailFailure()
        })
    }
}
