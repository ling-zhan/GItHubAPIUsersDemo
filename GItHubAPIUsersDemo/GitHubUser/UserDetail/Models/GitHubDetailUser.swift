//
//  GitHubDetailUser.swift
//  GItHubAPIUsersDemo
//
//  Created by Ling Zhan on 2024/8/13.
//

import Foundation

//{
//  "login": "mojombo",
//  "id": 1,
//  "node_id": "MDQ6VXNlcjE=",
//  "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
//  "gravatar_id": "",
//  "url": "https://api.github.com/users/mojombo",
//  "html_url": "https://github.com/mojombo",
//  "followers_url": "https://api.github.com/users/mojombo/followers",
//  "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
//  "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
//  "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
//  "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
//  "organizations_url": "https://api.github.com/users/mojombo/orgs",
//  "repos_url": "https://api.github.com/users/mojombo/repos",
//  "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
//  "received_events_url": "https://api.github.com/users/mojombo/received_events",
//  "type": "User",
//  "site_admin": false,
//  "name": "Tom Preston-Werner",
//  "company": "@chatterbugapp, @redwoodjs, @preston-werner-ventures ",
//  "blog": "http://tom.preston-werner.com",
//  "location": "San Francisco",
//  "email": null,
//  "hireable": null,
//  "bio": null,
//  "twitter_username": "mojombo",
//  "public_repos": 66,
//  "public_gists": 62,
//  "followers": 23982,
//  "following": 11,
//  "created_at": "2007-10-20T05:24:19Z",
//  "updated_at": "2024-07-14T20:45:58Z"
//}

struct GitHubDetailUser: Codable {
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
    var name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let twitterUsername: String?
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: String
    let updatedAt: String

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
        case name
        case company
        case blog
        case location
        case email
        case hireable
        case bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    static let mockGitHubDetailUser = GitHubDetailUser(
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
        siteAdmin: true,
        name: "Tom Preston-Werner",
        company: "@chatterbugapp, @redwoodjs, @preston-werner-ventures",
        blog: "http://tom.preston-werner.com",
        location: "San Francisco",
        email: nil,  // Note: JSON has `null`, which maps to Swift's `nil`
        hireable: nil,  // Note: JSON has `null`, which maps to Swift's `nil`
        bio: nil,  // Note: JSON has `null`, which maps to Swift's `nil`
        twitterUsername: "mojombo",
        publicRepos: 66,
        publicGists: 62,
        followers: 23982,
        following: 11,
        createdAt: "2007-10-20T05:24:19Z",
        updatedAt: "2024-07-14T20:45:58Z"
    )
}

