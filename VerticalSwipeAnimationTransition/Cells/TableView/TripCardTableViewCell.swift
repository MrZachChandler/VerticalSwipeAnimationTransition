//
//  TripCardTableViewCell.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/24/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import UIKit

class TripCardTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    private func setUp() {
        selectionStyle = .none

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TripCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TripCollectionViewCell")
        collectionView.register(UINib(nibName: "StepFieldCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StepFieldCollectionViewCell")

        collectionView.reloadData()
    }
}
extension TripCardTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "StepFieldCollectionViewCell", for: indexPath) as! StepFieldCollectionViewCell
        cell.grayView.clipsToBounds = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return contentView.frame.size
    }
}
