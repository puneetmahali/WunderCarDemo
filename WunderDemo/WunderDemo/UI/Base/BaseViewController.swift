//
//  ViewController.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 15.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = UIColor.red
        activityIndicatorView.sizeToFit()
        return activityIndicatorView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            setupTabBariOS13()
        } else {
            setupTabBar()
        }
    }
    
    func showErrorMessage(_ message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertViewController.addAction(UIAlertAction.init(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func showLoadingView(_ tableView: UITableView){
        tableView.sectionFooterHeight = 60
        tableView.tableFooterView = activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    func hideLoadingView(_ tableView: UITableView){
        if activityIndicatorView.isDescendant(of: tableView) {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
            tableView.tableFooterView = nil
        }
    }
    @available (iOS 13.0, *)
    //Mark: Setup TabBar
    func setupTabBariOS13() {
        tabBarController?.tabBar.items![0].title = "Cars"
        tabBarController?.tabBar.items![0].image = UIImage(systemName: "car")
        tabBarController?.tabBar.items![1].title = "Map"
        tabBarController?.tabBar.items![1].image = UIImage(systemName: "map")
    }
    
    func setupTabBar() {
        tabBarController?.tabBar.items![0].title = "Cars"
        tabBarController?.tabBar.items![0].image = #imageLiteral(resourceName: "car-icon")
        tabBarController?.tabBar.items![1].title = "Map"
        tabBarController?.tabBar.items![1].image = #imageLiteral(resourceName: "map-icon")
    
    }
}

