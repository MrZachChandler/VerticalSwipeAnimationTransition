//
//  StepFieldCollectionViewCell.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/24/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import UIKit

class StepFieldCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var segmentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        segmentView.layer.cornerRadius = 20
        segmentView.transform = CGAffineTransform(scaleX: 1, y: 1.2)

    }

}
