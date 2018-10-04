//
//  ImageModel.swift
//  instagramMVVM
//
//  Created by duy on 10/2/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import ObjectMapper

protocol ImageModelPresentable {
  var id: String? { get }
  var width: Int? { get }
  var height: Int? { get }
  var color: String? { get }
  var description: String? { get }
  var urls: ImageURL? { get }
  var links: ImageLink? { get }
  var likes: Int? { get }
  var likedByUser: Bool? { get }
  var user: ImageUser? { get }
}

struct ImageResponseModel: Mappable, ImageModelPresentable {
  var id: String?
  var width: Int?
  var height: Int?
  var color: String?
  var description: String?
  var urls: ImageURL?
  var links: ImageLink?
  var likes: Int?
  var likedByUser: Bool?
  var user: ImageUser?
  
    init() {
      self.id = ""
      self.width = 0
      self.height = 0
      self.color = ""
      self.description = ""
      self.urls = ImageURL()
      self.links = ImageLink()
      self.likes = 0
      self.likedByUser = false
      self.user = ImageUser()
    }
    init?(map: Map) {
  
    }
  
    mutating func mapping(map: Map) {
      id <- map["id"]
      width <- map["width"]
      height <- map["height"]
      color <- map["color"]
      description <- map["description"]
      urls <- map["urls"]
      links <- map["links"]
      likes <- map["likes"]
      likedByUser <- map["liked_by_user"]
      user <- map["user"]
    }
}

protocol ImageLinkPresentable {
  var linksSelf: String? { get }
  var html: String? { get }
  var download: String? { get }
  var downloadLocation: String? { get }
}

struct ImageLink: Mappable, ImageLinkPresentable {
  var linksSelf: String?
  var html: String?
  var download: String?
  var downloadLocation: String?
  
  init() {
    self.linksSelf = ""
    self.html = ""
    self.download = ""
    self.downloadLocation = ""
  }
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    linksSelf <- map["linksSelf"]
    html <- map["html"]
    download <- map["download"]
    downloadLocation <- map["download_location"]
  }
}

protocol ImageURLPresentable {
  var raw: String? { get }
  var full: String? { get }
  var regular: String? { get }
  var small: String? { get }
  var thumb: String? { get }
}

struct ImageURL: Mappable, ImageURLPresentable {
  var raw: String?
  var full: String?
  var regular: String?
  var small: String?
  var thumb: String?
  
  init() {
    self.raw = ""
    self.full = ""
    self.regular = ""
    self.small = ""
    self.thumb = ""
  }
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    raw <- map["raw"]
    full <- map["full"]
    regular <- map["regular"]
    small <- map["small"]
    thumb <- map["thumb"]
  }
}

protocol ImageUserPresentable {
  var id: String? { get }
  var username: String? { get }
  var name: String? { get }
  var firstName: String? { get }
  var lastName: String? { get }
  var twitterUsername: String? { get }
  var portfolioURL: String? { get }
  var bio: String? { get }
  var location: String? { get }
  var links: UserLink? { get }
  var profileImage: ProfileImage? { get }
  var instagramUsername: String? { get }
  var totalCollections: Int? { get }
  var totalLikes: Int? { get }
  var totalPhotos: Int? { get }
}

struct ImageUser: Mappable, ImageUserPresentable {
  var id: String?
  var username: String?
  var name: String?
  var firstName: String?
  var lastName: String?
  var twitterUsername: String?
  var portfolioURL: String?
  var bio: String?
  var location: String?
  var links: UserLink?
  var profileImage: ProfileImage?
  var instagramUsername: String?
  var totalCollections: Int?
  var totalLikes: Int?
  var totalPhotos: Int?
  
  init() {
    self.id = ""
    self.username = ""
    self.name = ""
    self.firstName = ""
    self.lastName = ""
    self.twitterUsername = ""
    self.portfolioURL = ""
    self.bio = ""
    self.location = ""
    self.links = UserLink()
    self.profileImage = ProfileImage()
    self.instagramUsername = ""
    self.totalCollections = 0
    self.totalLikes = 0
    self.totalPhotos = 0
  }
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    id <- map["id"]
    username <- map["username"]
    name <- map["name"]
    firstName <- map["firstName"]
    lastName <- map["lastName"]
    twitterUsername <- map["twitter_username"]
    portfolioURL <- map["portfolio_url"]
    bio <- map["bio"]
    location <- map["location"]
    links <- map["links"]
    profileImage <- map["profileImage"]
    instagramUsername <- map["instagram_username"]
    totalCollections <- map["total_collections"]
    totalLikes <- map["total_likes"]
    totalPhotos <- map["total_photos"]
  }

}

protocol UserLinkPresentable {
  var linksSelf: String? { get }
  var html: String? { get }
  var photos: String? { get }
  var likes: String? { get }
  var portfolio: String? { get }
  var following: String? { get }
  var followers: String? { get }
}

struct UserLink: Mappable, UserLinkPresentable {
  var linksSelf: String?
  var html: String?
  var photos: String?
  var likes: String?
  var portfolio: String?
  var following: String?
  var followers: String?
  
  init() {
    self.linksSelf = ""
    self.html = ""
    self.photos = ""
    self.likes = ""
    self.portfolio = ""
    self.following = ""
    self.followers = ""
  }
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    linksSelf <- map["self"]
    html <- map["html"]
    photos <- map["photos"]
    likes <- map["likes"]
    portfolio <- map["portfolio"]
    following <- map["following"]
    followers <- map["followers"]
  }
}

protocol ProfileImagePresentable {
  var small: String? { get }
  var medium: String? { get }
  var large: String? { get }
}

struct ProfileImage: Mappable, ProfileImagePresentable {
  var small: String?
  var medium: String?
  var large: String?
  
  init() {
    self.small = ""
    self.medium = ""
    self.large = ""
  }
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    small <- map["small"]
    medium <- map["medium"]
    large <- map["large"]
  }
}
