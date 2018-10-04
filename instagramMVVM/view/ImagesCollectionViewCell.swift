//
//  ImagesCollectionViewCell.swift
//  instagramMVVM
//
//  Created by duy on 10/1/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var thumbImageView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func configure(image: UIImage) {
    self.thumbImageView.image = image
//    let queue = DispatchQueue(label: "loadhinh")
//    queue.async {
//      do {
//        let data = try Data(contentsOf: URL(string: url)!)
//        DispatchQueue.main.async {
//          self.thumbImageView.image = UIImage(data: data)
//        }
//      } catch {
//
//      }
//    }
  }
}
