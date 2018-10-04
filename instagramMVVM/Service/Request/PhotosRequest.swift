//
//  PhotosRequest.swift
//  instagramMVVM
//
//  Created by duy on 9/19/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class PhotosRequest: Request {
  func parseData(_ object: AnyObject, data: HTTPURLResponse) -> [ImageResponseModel]? {
    guard let model = Mapper<ImageResponseModel>().mapArray(JSONObject: object) else {
      return nil
    }
    return model
  }
  
  init(page: Int, perPage: Int) {
    self.page = page
    self.perPage = perPage
  }
  typealias BaseResponse = [ImageResponse]
  
  var page: Int
  var perPage: Int
  
  var headerFields: [String : String] {
    return [:]
  }
  var method: HTTPMethod {
    return .get
  }
  var params: [String : AnyObject] {
    return [:]
  }
  var path: String {
    return "?client_id=\(AppConstant.AccessKey)&page=\(page)&per_page=\(perPage)"
  }
  var timeout: TimeInterval {
    return 10
  }
}
