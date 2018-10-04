//
//  ImageResponse.swift
//  instagramMVVM
//
//  Created by duy on 10/2/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageResponse : BaseResponse {
  var response : [ImageResponseModel] = []
  required init?(map: Map) {
    super.init(map: map)
  }
  override func mapping(map: Map) {
    super.mapping(map: map)
    response <- map
  }
}
