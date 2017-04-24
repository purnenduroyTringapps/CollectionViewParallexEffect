//
//  CollectionViewCell.swift
//  UICollectionViewDemo
//
//  Created by Purnendu on 4/17/17.
//  Copyright © 2017 com.tringapps. All rights reserved.
//

import UIKit
import CoreGraphics

let ImageHeight: CGFloat = 200.0
let OffsetSpeed: CGFloat = 25.0


class CollectionViewCell: UICollectionViewCell {
  
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var textLabel: UILabel!
  
  var image: UIImage = UIImage() {
    didSet {
      imageView.image = image
    }
  }
  
  var text:String = String() {
    didSet {
      textLabel.text = text
    }
  }
  
  func imageOffSet(_ offset: CGPoint)
  {
    imageView.frame = self.imageView.bounds.offsetBy(dx: offset.x, dy: offset.y)
  }
  
}
