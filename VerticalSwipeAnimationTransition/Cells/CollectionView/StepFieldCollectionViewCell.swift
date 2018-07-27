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
    @IBOutlet weak var segmentImageView: UIImageView!
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
        // Initialization code
        segmentView.layer.cornerRadius = 10
        segmentView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.segmentImageView?.image = self.segmentImageView?.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.segmentImageView?.tintColor = UIColor.white
        setHeroForSubViews()
    }
    
    func setHeroForSubViews() {
        grayView.hero.id = "grayView"
        segmentView.hero.id = "segment"
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

}
