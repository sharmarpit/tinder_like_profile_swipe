//
//  HomeViewModel.swift
//  statusneo_project
//
//  Created by arpit sharma on 18/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

class HomeViewModel:NSObject
{
    
     let homeModel:Home;
    override init() {
       homeModel = Home()
        super.init()
        self.downloadNewProfile()
    }
    
    func getUpProfileViewModel() -> ProfileViewModel
    {
        return ProfileViewModel(user: homeModel.currentUser());
    }
    
    func downloadNewProfile()
    {
        homeModel.downloadProfiles();
    }
    
    func addUserToFavList()
    {
        UserService.shared.setFavUser(user: homeModel.currentUser())
    }
}
