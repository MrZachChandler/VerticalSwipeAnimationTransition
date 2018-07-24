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

    override func awakeFromNib() {
        super.awakeFromNib()
        viewMask.clipsToBounds = true
        segmentView.layer.cornerRadius = 20
        curvedView.clipsToBounds = true
        curvedView.layer.cornerRadius = (cardView.frame.width / 2) + 150
        curvedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}

