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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    private func setUp() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backTapped))
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.isTranslucent = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "RoundedTopTableViewCell", bundle: nil), forCellReuseIdentifier: "RoundedTopTableViewCell")
        tableView.register(UINib(nibName: "TripCardTableViewCell", bundle: nil), forCellReuseIdentifier: "TripCardTableViewCell")
        self.navigationController?.hero.isEnabled = true

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
            return tableView.dequeueReusableCell(withIdentifier: "TripCardTableViewCell") as! TripCardTableViewCell
        }
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "IndexPath.row - \(indexPath.row)"
        cell.contentView.hero.id = "baseView"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        }
        if indexPath.row == 1 {
            return 170
        }
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
