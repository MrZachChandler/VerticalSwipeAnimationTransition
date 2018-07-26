//
//  TripCollectionViewCell.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/23/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import Foundation
import UIKit

class TripCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardView:UIView!
    @IBOutlet weak var curvedView: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var viewMask: UIView!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var carImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.carImageView?.image = self.carImageView?.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.carImageView?.tintColor = UIColor.white
        viewMask.clipsToBounds = true
        segmentView.layer.cornerRadius = 10
        curvedView.clipsToBounds = true
        curvedView.layer.cornerRadius = (cardView.frame.width / 2) + 170
        curvedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    func setConstraintHeight(constant: CGFloat) {
        verticalConstraint.constant = constant
    }
}

