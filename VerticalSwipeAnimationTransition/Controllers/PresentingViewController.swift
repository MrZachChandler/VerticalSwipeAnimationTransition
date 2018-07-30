//
//  PresentingViewController.swift
//  VerticalSwipeAnimationTransition
//
//  Created by Zachary Chandler on 7/24/18.
//  Copyright © 2018 Zachary Chandler. All rights reserved.
//

import Foundation
import UIKit

class PresentingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    var selectedIndex: IndexPath!
    var exitControl = UIRefreshControl()
    
    var cells: [UITableViewCell] = []
    private var observerContext = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    func prepareBackgroundView(){
//        let blurEffect = UIBlurEffect.init(style: .regular)
//        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
//        let bluredView = UIVisualEffectView.init(effect: blurEffect)
//        bluredView.contentView.addSubview(visualEffect)
//        
//        visualEffect.frame = UIScreen.main.bounds
//        bluredView.frame = UIScreen.main.bounds
//        
//        backgroundImageView.insertSubview(bluredView, at: 0)
    }
    private func setUp() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.isTranslucent = false
        
        let exitTitle = NSMutableAttributedString(string: "Pull to exit", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15.0)])
        exitControl.attributedTitle = exitTitle
        exitControl.tintColor = .clear
        exitControl.contentScaleFactor = 0.5
        exitControl.addTarget(self, action: #selector(exitPresentation), for: UIControlEvents.valueChanged)
        exitControl.frame = CGRect(origin: exitControl.frame.origin, size: CGSize(width: exitControl.frame.width , height: exitControl.frame.height / 2))
        tableView.addSubview(exitControl)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false 
        tableView.register(UINib(nibName: "RoundedTopTableViewCell", bundle: nil), forCellReuseIdentifier: "RoundedTopTableViewCell")
        tableView.register(UINib(nibName: "TripCardTableViewCell", bundle: nil), forCellReuseIdentifier: "TripCardTableViewCell")
        self.navigationController?.hero.isEnabled = true
        prepareBackgroundView()
        
    }
    @objc func exitPresentation() {
        exitControl.attributedTitle = NSAttributedString(string: "")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func backTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension PresentingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return tableView.dequeueReusableCell(withIdentifier: "RoundedTopTableViewCell") as! RoundedTopTableViewCell
        }
        if indexPath.row == 1 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "TripCardTableViewCell") as! TripCardTableViewCell
            cell.selectedIndex = selectedIndex
            return cell
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = "IndexPath.row - \(indexPath.row)"
        cell.textLabel?.hero.id = "dots"
        cells.append(cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }
        if indexPath.row == 1 {
            return 210
        }
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.dismiss(animated: true)
        }
    }
}
