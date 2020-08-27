//
//  DashboardViewController.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    let infoTableView = UITableView() // tableView
    let dataSource = DashboardDataSource()
    var refreshControl = UIRefreshControl()
    
    
    lazy var dashboardViewModel : DashboardViewModel = {
        let viewModel = DashboardViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpTableView()
        self.registerCellOfTableView()
        self.updateListAfterNotification()
        self.getSetValue()
    }
    
    func setUpTableView() {
        
        view.addSubview(infoTableView)
        
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        infoTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        infoTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        infoTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        infoTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        infoTableView.dataSource = self.dataSource
        infoTableView.delegate = self
        infoTableView.tableFooterView = UIView(frame: CGRect.zero)
        infoTableView.rowHeight = UITableView.automaticDimension
        
        refreshControl.attributedTitle = NSAttributedString(string:Constants.pullToRefresh )
        
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        infoTableView.addSubview(refreshControl) // not required when using UITableViewController
        
    }
    
    func registerCellOfTableView() {
        infoTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "informationCell")
    }
    
    func updateListAfterNotification() {
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.navigationItem.title = self?.dashboardViewModel.title ?? ""
            self?.infoTableView.reloadData()
        }
    }

    func getSetValue() {
          // add error handling example
          self.dashboardViewModel.onErrorHandling = { [weak self] error in
              // display error ?
              let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
              controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
              self?.present(controller, animated: true, completion: nil)
          }
          self.dashboardViewModel.fetchDashboardData()
      }
      
      
    @objc func refresh(sender:AnyObject) {
        self.getSetValue()
        self.refreshControl.endRefreshing()
    }
    
    
}

extension DashboardViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


