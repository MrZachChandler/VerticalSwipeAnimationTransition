//
//  TripCardTableViewCell.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/24/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import UIKit

class TripCardTableViewCell: UITableViewCell {

    @IBOutlet weak var segmentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    private func setUp() {
        segmentView.layer.cornerRadius = 20
//        segmentView.backgroundColor = UIColor.purple
    }
}
