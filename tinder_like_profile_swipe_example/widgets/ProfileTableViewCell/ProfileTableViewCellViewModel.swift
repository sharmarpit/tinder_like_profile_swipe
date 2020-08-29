//
//  ProfileTableViewCellViewModel.swift
//  tabexampleApp
//
//  Created by arpit sharma on 23/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

class ProfileTableViewCellViewModel: NSObject {
    static let IDENTIFIER:String = "PROFILE_IMAGE"
    var profileImageURL:URL?
    var userName:String?
    private let userProfile:User?
    init(user:User) {
        userProfile = user
        var pictureURL = user.picture;
        if(!user.picture.contains("https"))
        {
           pictureURL = user.picture.replacingOccurrences(of: "http", with: "https")
        }
        profileImageURL = URL(string: pictureURL)
        userName = user.name.first + " " + user.name.last
    }
}
