//
//  Home.swift
//  statusneo_project
//
//  Created by arpit sharma on 18/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

class Home {
    
    let userService:UserService;
    
    init() {
        userService = UserService.shared
    }
    
    func downloadProfiles() {
        userService.RequestUserProfiles();
    }
    
    func currentUser() -> User {
        return userService.getCurrentUser()!
    }
    
}
