//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Purnendu on 4/17/17.
//  Copyright © 2017 com.tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

  @IBOutlet var collectionView: UICollectionView!
  
  let labelTextArray = ["Beautiful destination of geneva", "Amsterdam", "Site of nevada", "View from the beautiful hill", "charm of effil tower", "Beautiful destination of geneva", "Amsterdam", "Site of nevada", "View from the beautiful hill", "charm of effil tower"]
  
  let imageArray = [UIImage.init(named: "1"), UIImage.init(named: "2"), UIImage.init(named: "3"), UIImage.init(named: "4"), UIImage.init(named: "5"), UIImage.init(named: "6"), UIImage.init(named: "7"), UIImage.init(named: "8"), UIImage.init(named: "9"), UIImage.init(named: "10")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    collectionView.backgroundColor = UIColor.clear
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageArray.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    let imageName:String = "\(indexPath.row + 1)"
    let imageForCell:UIImage = UIImage.init(named: imageName)!
    cell.image = imageForCell
    cell.text = labelTextArray[indexPath.row]
    return cell
  }
  
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //guard let collectionView = self.collectionView else { return }
   //guard let visibleCells = self.collectionView.visibleCells as? [CollectionViewCell] else { return }
    for view in collectionView.visibleCells {
      let view:CollectionViewCell = view as! CollectionViewCell
      let yOffSet:CGFloat = ((collectionView.contentOffset.y - view.frame.origin.y) / (view.image.size.height)) * OffsetSpeed
      view.imageOffSet(CGPoint.init(x: 0.0, y: yOffSet))
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let image = imageArray[indexPath.row]
    let cellHeight = (collectionView.frame.width * (image?.size.height)!) / (image?.size.width)!
    return CGSize(width: collectionView.frame.size.width, height: cellHeight)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    performSegue(withIdentifier: "showImage", sender: indexPath)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let index = sender as! IndexPath
    if segue.identifier == "showImage" {
      let newVC = segue.destination as! NewViewController
      newVC.image = self.imageArray[index.row]!
    }
  }
  
}

