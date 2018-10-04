//
//  Request.swift
//  instagramMVVM
//
//  Created by duy on 9/19/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

protocol Request {
  
  associatedtype BaseResponse
  
  var headerFields : [String : String] { get }
  var params : [String : AnyObject] { get }
  var path : String { get }
  var timeout : TimeInterval { get }
  var method: HTTPMethod { get }
  
  func parseData(_ object: AnyObject, data : HTTPURLResponse) -> [ImageResponseModel]?
  
}

extension Request where BaseResponse : Mappable {
  func parseData(_ object: AnyObject, data : HTTPURLResponse) -> [ImageResponseModel]? {
    guard let model = Mapper<ImageResponseModel>().mapArray(JSONObject: object) else {
      return nil
    }
    return model
  }
}
