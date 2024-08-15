//
//  HttpManager.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import Foundation

class HttpManager {
    
    static let shared = HttpManager()
    
    // MARK: - Get GitHub users
    func getGitHubUsers(since: Int = 0,
                        success: @escaping ([GitHubUser]?) -> Void,
                        failure: @escaping (HttpError?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/users?since=\(since)&per_page=20") else {
            failure(HttpError.invalidURL)
            return
        }
        
        self.request(url: url) { data, response, error in
            
            DispatchQueue.main.async {
                // 檢查 response statusCode
                if let response = response as? HTTPURLResponse {
                    if response.statusCode != 200 {
                        failure(HttpError.invalidResopnse)
                        return
                    }
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let users = try decoder.decode([GitHubUser].self, from: data)
                            success(users)
                        } catch {
                            failure(HttpError.invalidData)
                        }
                    } else {
                        failure(HttpError.invalidData)
                    }
                }
            }
        }
    }
    
    // MARK: - Get user detail
    func getGitHubUserDetail(username: String,
                        success: @escaping (GitHubDetailUser?) -> Void,
                             failure: @escaping (HttpError?) -> Void) {
        
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            failure(HttpError.invalidURL)
            return
        }
        
        self.request(url: url) { data, response, error in
            
            DispatchQueue.main.async {
                // 檢查 response statusCode
                if let response = response as? HTTPURLResponse {
                    if response.statusCode != 200 {
                        failure(HttpError.invalidResopnse)
                        return
                    }
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let user = try decoder.decode(GitHubDetailUser.self, from: data)
                            success(user)
                        } catch {
                            failure(HttpError.invalidData)
                        }
                    } else {
                        failure(HttpError.invalidData)
                    }
                }
            }
        }
        
    }

}

// MARK: - Basic request
extension HttpManager {
    func request(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
}

// MARK: - Load image
extension HttpManager {
    // 加載網路圖片
    func loadImage(url: URL, completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data)
        }
        task.resume()
    }
}
