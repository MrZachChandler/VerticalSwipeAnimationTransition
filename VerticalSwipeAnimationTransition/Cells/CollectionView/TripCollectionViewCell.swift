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
    @IBOutlet weak var segmentLabel: UILabel!
    
    
    @IBOutlet weak var originImageView: UIImageView!
    @IBOutlet weak var destImageView: UIImageView!
    
    @IBOutlet weak var dividerLine: UIView!
    @IBOutlet weak var toFromLine: UIView!
    
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var destLabel: UILabel!
    
    @IBOutlet weak var pM: UILabel!
    @IBOutlet weak var dM: UILabel!
    @IBOutlet weak var pickUpTimeLabel: UILabel!
    @IBOutlet weak var pickUpLabel: UILabel!
    @IBOutlet weak var dropOffTimeLabel: UILabel!
    @IBOutlet weak var dropOffLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    

    
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
    
    func setHeroForSubViews() {
        segmentView.hero.id = "segment"
        viewMask.hero.id = "roundedTop"
//        grayView.hero.id = "grayView"
        segmentView.hero.id = "segment"
        carImageView.hero.id = "segmentImage"
        segmentLabel.hero.id = "segmentLabel"
        originImageView.hero.id = "originImage"
        destImageView.hero.id = "destImageView"
        dividerLine.hero.id = "dividerLine"
        toFromLine.hero.id = "toFromLine"
        originLabel.hero.id = "originLabel"
        destLabel.hero.id = "destLabel"
        pM.hero.id = "pM"
        dM.hero.id = "dM"
        pickUpTimeLabel.hero.id = "pickUpTimeLabel"
        pickUpLabel.hero.id = "pickUpLabel"
        dropOffTimeLabel.hero.id = "dropOffTimeLabel"
        dropOffLabel.hero.id = "dropOffLabel"
        statusLabel.hero.id = "statusLabel"
        dateLabel.hero.id = "dateLabel"
    }
    func removeHeroForSubViews() {
        cardView.hero.id = ""
        segmentView.hero.id = ""
        viewMask.hero.id = ""
//        grayView.hero.id = ""
        segmentView.hero.id = ""
        carImageView.hero.id = ""
        segmentLabel.hero.id = ""
        originImageView.hero.id = ""
        destImageView.hero.id = ""
        dividerLine.hero.id = ""
        toFromLine.hero.id = ""
        originLabel.hero.id = ""
        destLabel.hero.id = ""
        pM.hero.id = ""
        dM.hero.id = ""
        pickUpTimeLabel.hero.id = ""
        pickUpLabel.hero.id = ""
        dropOffTimeLabel.hero.id = ""
        dropOffLabel.hero.id = ""
        statusLabel.hero.id = ""
        dateLabel.hero.id = ""
    }
}

