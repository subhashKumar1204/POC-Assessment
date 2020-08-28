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
        self.getDatafromViewModel()
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
    
    //Registering Tableview Cell
    func registerCellOfTableView() {
        infoTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "informationCell")
    }
    
    //Update View when API call completed
    func updateListAfterNotification() {
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.navigationItem.title = self?.dashboardViewModel.title ?? ""
            self?.infoTableView.reloadData()
        }
    }

    //View Model api call
    func getDatafromViewModel() {
        // return error in this block 
        self.dashboardViewModel.onErrorHandling = { [weak self] error in
            self?.displayAlert("\((APIError.localizedDescription(.invalidResponse))())")
            self?.infoTableView.reloadData()
        }
        if let reachability = Reachability(), !reachability.isReachable {
            self.displayAlert("\((APIError.localizedDescription(.noInternetConnection))())")
        }else{
            self.dashboardViewModel.fetchDashboardData()
        }
    }
      
    //Pull to refresh Action
    @objc func refresh(sender:AnyObject) {
        
        self.getDatafromViewModel()
        self.refreshControl.endRefreshing()
    }
    
    func displayAlert(_ message : String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
  
}

extension DashboardViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


