//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

  @IBOutlet weak var tableView: UITableView!
  
  var searchBar:  UISearchBar!
  var businesses: [Business]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate           = self
    tableView.dataSource         = self
    tableView.rowHeight          = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 120
    
    searchBar                = UISearchBar()
    searchBar.delegate       = self
    searchBar.placeholder    = "Resturants"
    navigationItem.titleView = searchBar
    searchBar.sizeToFit()
    
    navigationController?.navigationBar.barTintColor = UIColor.redColor()
    navigationController?.navigationBar.translucent  = false
    UIApplication.sharedApplication().statusBarStyle = .LightContent
    

    Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
      self.businesses = businesses
      self.tableView.reloadData()
    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return businesses?.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("BuisnessCell") as! BusinessCell
    cell.business = businesses![indexPath.row]
    return cell
  }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    Business.searchWithTerm(searchBar.text ?? "") { (businesses: [Business]!, error: NSError!) -> Void in
      self.businesses = businesses
      self.tableView.reloadData()
    }
  }

}
