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
    @IBOutlet weak var viewMask: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    private func setUp() {
        selectionStyle = .none
        viewMask.clipsToBounds = true
        roundedView.layer.cornerRadius = (contentView.frame.width / 2) + 200
        handleView.backgroundColor = UIColor.purple
//        contentView.backgroundColor = UIColor.black
        self.contentView.clipsToBounds = true
        self.backgroundColor = .clear
    }
}
