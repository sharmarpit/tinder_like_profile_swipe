//
//  FavouriteProfilesViewController.swift
//  tabexampleApp
//
//  Created by arpit sharma on 23/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

import UIKit

class FavouriteProfilesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
     @IBOutlet weak var tableView: UITableView!
    
    let viewModel = FavouriteProfilesViewModel()

    override func viewDidAppear(_ animated: Bool) {
        viewModel.updateDetails()
             
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       tableView.register(UINib(nibName: "ProfileTableViewCellView", bundle: nil), forCellReuseIdentifier: ProfileTableViewCellViewModel.IDENTIFIER)
                    tableView.delegate = self
                    tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellViewModels.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
     }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if(self.viewModel.cellViewModels.count - 1  <=  indexPath.count)
        //{
        let cell:ProfileTableViewCellView = self.tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCellViewModel.IDENTIFIER) as! ProfileTableViewCellView
            let cellViewModel =  self.viewModel.cellViewModels[indexPath.item]
        // note that indexPath.section is used rather than indexPath.row
        cell.setUPCell(cellViewModel: cellViewModel)
        
        return cell
        //}
        //return UITableViewCell()
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }

}
