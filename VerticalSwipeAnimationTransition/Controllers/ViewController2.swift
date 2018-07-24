//
//  ViewController2.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/23/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var dataSource = [1,2,3]
    var cells: [TripCollectionViewCell] = []
    //paging
    @IBOutlet private weak var collectionViewLayout: UICollectionViewFlowLayout!
    private var indexOfCellBeforeDragging = 0

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        collectionViewLayout.minimumLineSpacing = 0

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateVisibleCell(forIndex: 0)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureCollectionViewLayoutItemSize()
    }
    
    private func calculateSectionInset() -> CGFloat {
        let cellBodyWidth: CGFloat = 326
        let inset = ((collectionViewLayout.collectionView!.frame.width - cellBodyWidth) / 4)  + 20.0
        return inset
        
    }
    
    private func configureCollectionViewLayoutItemSize() {
        let inset: CGFloat = calculateSectionInset()
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
        collectionViewLayout.itemSize = CGSize(width: collectionViewLayout.collectionView!.frame.size.width - inset * 2, height: collectionViewLayout.collectionView!.frame.size.height)
    }
    
    private func indexOfMajorCell() -> Int {
        let itemWidth = collectionViewLayout.itemSize.width
        let proportionalOffset = collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        return Int(round(proportionalOffset))
    }
    //^^
    private func animateVisibleCell(forIndex index: Int) {
        var curIndex = 0
        for cell in cells {
            if index == curIndex {
                UIView.animate(withDuration: 0.221) {
                    cell.contentView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }
            } else {
                UIView.animate(withDuration: 0.221) {
                    cell.contentView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
            curIndex += 1
        }
    }
}
extension ViewController2: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = dataSource.count
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? TripCollectionViewCell)!
        if cells.count < dataSource.count {
            cells.append(cell)
        }
        return cell
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
        animateVisibleCell(forIndex: indexPath.row)
        pageControl.currentPage = indexPath.row
        
    }
}
