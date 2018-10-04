//
//  ImageViewModel.swift
//  instagramMVVM
//
//  Created by duy on 10/2/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class ImageViewModel {
  var images: BehaviorRelay<[ImageResponseModel]> = BehaviorRelay(value: [])
  var page: BehaviorRelay<Int> = BehaviorRelay(value: 0)
  var imagesList: BehaviorRelay<[ImageModel]> = BehaviorRelay(value: [])
  
  init() {
    _ = self.page
      .asObservable()
      .subscribe(onNext: { [weak self] page in
      self?.loadImage(page: page, perPage: 30)
    })
    _ = self.images
      .asObservable()
      .subscribe(onNext: { [weak self] imagesArray in
//        let queue = DispatchQueue(label: "load")
        let realCountImages = (self?.imagesList.value.count)!
        let updateIndex = realCountImages - imagesArray.count
        var newImageList = self?.imagesList.value
        for index in 0..<imagesArray.count {
          let queue = DispatchQueue(label: "load")
          let cacheImage = imagesArray[index].urls?.thumb
          queue.async {
            do {
              let data = try Data(contentsOf: URL(string: cacheImage!)!)
              newImageList![updateIndex + index] = ImageModel(thumb: UIImage(data: data)!, full: UIImage(data: data)!)
              self?.imagesList.accept(newImageList!)
              newImageList = self?.imagesList.value
            } catch {}
          }
        }
      })
  }

  func loadImage(page: Int, perPage: Int) {
    let request = PhotosRequest(page: page, perPage: perPage)
    _ = APIClient.rx_request(request: request).subscribe(onNext: {[weak self] response in
      self?.initImagesList(number: 30)
      self?.images.accept(response)
    }, onError: nil, onCompleted: nil, onDisposed: nil)
  }
  
  func loadMore(index: Int) {
    if index == self.imagesList.value.count {
      self.page.accept(self.page.value + 1)
    }
  }
  
  func initImagesList(number: Int) {
    var newImages: [ImageModel] = self.imagesList.value
    for _ in 0..<number {
      newImages.append(ImageModel(thumb: AppConstant.defaultImage!, full: AppConstant.defaultImage!))
    }
    self.imagesList.accept(newImages)
  }
  
  func renderImage(index: Int, thumb: UIImage, full: UIImage) {
    var newImageList = self.imagesList.value
    newImageList[index] = ImageModel(thumb: thumb, full: full)
    self.imagesList.accept(newImageList)
  }
}
