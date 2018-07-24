//
//  RoundedTop.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/24/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import Foundation
import UIKit

class RoundedTopTableViewCell: UITableViewCell  {
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var handleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    private func setUp() {
        roundedView.hero.id = ""
        roundedView.layer.cornerRadius = (contentView.frame.width / 2) + 120
        handleView.backgroundColor = UIColor.purple
//        contentView.backgroundColor = UIColor.black
        self.contentView.clipsToBounds = true
        self.backgroundColor = .clear
    }
}
