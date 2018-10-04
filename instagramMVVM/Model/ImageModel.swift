//
//  ImageModel.swift
//  instagramMVVM
//
//  Created by duy on 10/3/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import UIKit

class ImageModel {
  var thumb: UIImage
  var full: UIImage
  
  init(thumb: UIImage, full: UIImage) {
    self.thumb = thumb
    self.full = full
  }
}
