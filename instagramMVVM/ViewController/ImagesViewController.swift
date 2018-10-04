//
//  ImagesViewController.swift
//  instagramMVVM
//
//  Created by duy on 10/1/18.
//  Copyright © 2018 app1 name. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ImagesViewController: UIViewController {

  @IBOutlet weak var listButton: UIButton!
  @IBOutlet weak var columnButton: UIButton!
  @IBOutlet weak var imagesListCollectionView: UICollectionView!
  var imagesViewModel = ImageViewModel()
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let nid = UINib(nibName: "ImagesCollectionViewCell", bundle: nil)
    imagesListCollectionView.register(nid, forCellWithReuseIdentifier: "ImagesCollectionViewCell")
    configCollectionViewLayout()
    
    self.imagesViewModel.imagesList
      .asObservable()
      .bind(to: imagesListCollectionView.rx.items(cellIdentifier: "ImagesCollectionViewCell", cellType: ImagesCollectionViewCell.self)) { index, model, cell in
        cell.configure(image: model.thumb)
      }
      .disposed(by: disposeBag)
//    self.imagesViewModel.images
//      .asObservable()
//      .bind(to: imagesListCollectionView.rx.items(cellIdentifier: "ImagesCollectionViewCell", cellType: ImagesCollectionViewCell.self)) { index, model, cell in
//        cell.configure(image: UIImage(named: "placeholder")!)
//      }
//      .disposed(by: disposeBag)
    
    imagesListCollectionView.rx
      .willDisplayCell
      .subscribe(onNext: { cell, indexPath in
        print(indexPath.row)
        if indexPath.row == self.imagesViewModel.imagesList.value.count - 1 {
          self.imagesViewModel.loadMore(index: self.imagesViewModel.imagesList.value.count)
        }
      })
      .disposed(by: disposeBag)
  }

  @IBAction func listButtonTouchUp(_ sender: Any) {
  }
  @IBAction func columnButtonTouchUp(_ sender: Any) {
  }
  
  func configCollectionViewLayout() {
    let flow = self.imagesListCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    let width = UIScreen.main.bounds.size.width - CGFloat(AppConstant.listItemSpacing) * CGFloat(AppConstant.listItemsInLine - 1)
    flow.itemSize = CGSize(width: floor(width / CGFloat(AppConstant.listItemsInLine)), height: width / CGFloat(AppConstant.listItemsInLine))
    flow.minimumInteritemSpacing = CGFloat(AppConstant.minimumInteritemSpacing)
    flow.minimumLineSpacing = CGFloat(AppConstant.minimumLineSpacing)
  }
}
