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
    @IBOutlet private weak var collectionViewLayout: UICollectionViewFlowLayout!
    private var indexOfCellBeforeDragging = 0

    var selectedIndex: IndexPath!
    var dataSource = [1,2,3]
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    private func indexOfMajorCell() -> Int {
        let itemWidth = collectionViewLayout.itemSize.width
        let proportionalOffset = collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        if index == dataSource.count {
            return dataSource.count - 1
        }
        return index
    }
    
    private func configureCollectionViewLayoutItemSize() {
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.itemSize = CGSize(width: collectionViewLayout.collectionView!.frame.size.width, height: collectionViewLayout.collectionView!.frame.size.height)
    }

    private func setUp() {
        selectionStyle = .none
        configureCollectionViewLayoutItemSize()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TripCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TripCollectionViewCell")
        collectionView.register(UINib(nibName: "StepFieldCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StepFieldCollectionViewCell")

        collectionView.reloadData()
//        collectionView.scrollToItem(at: selectedIndex, at: .centeredHorizontally, animated: false)
    }
}
extension TripCardTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "StepFieldCollectionViewCell", for: indexPath) as! StepFieldCollectionViewCell
        cell.grayView.clipsToBounds = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return contentView.frame.size
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = indexOfMajorCell()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrollView sliding:
        targetContentOffset.pointee = scrollView.contentOffset
        
        // calculate where scrollView should snap to:
        let indexOfMajorCell = self.indexOfMajorCell()
        
        //Perform Animation
        let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
        collectionViewLayout.collectionView!.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        pageControl.currentPage = indexPath.row
        
    }
}
