//
//  HttpError.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import Foundation

/// Http 錯誤類別
enum HttpError: Error {
    /// 無法取得網址
    case invalidURL
    /// 無效的回應
    case invalidResopnse
    /// 無效的資料
    case invalidData
}
