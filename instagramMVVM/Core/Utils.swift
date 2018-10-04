//
//  Utils.swift
//  instagramMVVM
//
//  Created by duy on 9/19/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Utils {
  static func convertParameterToData(_ parameters: [String: AnyObject], encode: String.Encoding = .utf8) -> Data {
    let data = parameters.stringFromHttpParameters().data(using: encode, allowLossyConversion: false)
    return data ?? Data()
  }
}

extension Dictionary {
  public func stringFromHttpParameters() -> String {
    let parameterArray = self.map { (key, value) -> String in
      guard let keyString = key as? String, let percentEscapedKey = keyString.stringByAddingPercentEncodingForURLQueryValue() else { return "" }
      guard let valueString = value as? String, let percentEscapedValue = valueString.stringByAddingPercentEncodingForURLQueryValue() else { return "" }
      return "\(percentEscapedKey)=\(percentEscapedValue)"
    }
    return parameterArray.joined(separator: "&")
  }
}

extension String {
  public func stringByAddingPercentEncodingForURLQueryValue() -> String? {
    let characterSet = NSMutableCharacterSet.alphanumeric()
    characterSet.addCharacters(in: "-._~")
    return self.addingPercentEncoding(withAllowedCharacters: characterSet as CharacterSet)
  }
}

extension UIImage {
  func resizeImage(newWidth: CGFloat) -> UIImage {
    
    let scale = newWidth / self.size.width
    let newHeight = self.size.height * scale
    UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
    self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
  }
}
