//
//  GitHubUser.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import Foundation

//{
//    "login": "mojombo",
//    "id": 1,
//    "node_id": "MDQ6VXNlcjE=",
//    "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/mojombo",
//    "html_url": "https://github.com/mojombo",
//    "followers_url": "https://api.github.com/users/mojombo/followers",
//    "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
//    "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
//    "organizations_url": "https://api.github.com/users/mojombo/orgs",
//    "repos_url": "https://api.github.com/users/mojombo/repos",
//    "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/mojombo/received_events",
//    "type": "User",
//    "site_admin": false
//  }


struct GitHubUser: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
    
    static let mockGitHubUser: GitHubUser = GitHubUser(
        login: "mojombo",
        id: 1,
        nodeID: "MDQ6VXNlcjE=",
        avatarURL: "https://avatars.githubusercontent.com/u/1?v=4",
        gravatarID: "",
        url: "https://api.github.com/users/mojombo",
        htmlURL: "https://github.com/mojombo",
        followersURL: "https://api.github.com/users/mojombo/followers",
        followingURL: "https://api.github.com/users/mojombo/following{/other_user}",
        gistsURL: "https://api.github.com/users/mojombo/gists{/gist_id}",
        starredURL: "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
        subscriptionsURL: "https://api.github.com/users/mojombo/subscriptions",
        organizationsURL: "https://api.github.com/users/mojombo/orgs",
        reposURL: "https://api.github.com/users/mojombo/repos",
        eventsURL: "https://api.github.com/users/mojombo/events{/privacy}",
        receivedEventsURL: "https://api.github.com/users/mojombo/received_events",
        type: "User",
        siteAdmin: true)
}


