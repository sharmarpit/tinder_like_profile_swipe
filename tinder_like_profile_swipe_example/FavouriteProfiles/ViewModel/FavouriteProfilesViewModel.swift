//
//  FavouriteProfilesViewModel.swift
//  tabexampleApp
//
//  Created by arpit sharma on 23/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

class FavouriteProfilesViewModel: NSObject
{
    var favUsers:Array<User>
    var cellViewModels:Array<ProfileTableViewCellViewModel> = Array()
    override init() {
      favUsers =   UserService.shared.getFavUsers()
        super.init()
        self.setUpCellViewModels()
    }
    
    func updateDetails()
    {
        cellViewModels.removeAll()
        favUsers =   UserService.shared.getFavUsers()
        self.setUpCellViewModels()
    }
    func setUpCellViewModels()
    {
        for user in favUsers {
            
            let cellViewModel = ProfileTableViewCellViewModel(user: user)
            cellViewModels.append(cellViewModel)
        }
    }
    
}
