//
//  ProfileViewModel.swift
//  tabexampleApp
//
//  Created by arpit sharma on 21/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation
enum BOTTOM_BUTTON_TAG : Int
{
   case PROFILE = 0, CALENDER ,LOCATION ,PHONE,LOCK
    
}
class ProfileViewModel: NSObject {
       
    var bottomButtonTag : BOTTOM_BUTTON_TAG = .LOCATION
    var title:String? = nil
    var info:String? = nil
    var imageURL:URL? = nil;
    
    let user:User;
     init(user:User)
     {
        self.user = user
        var pictureURL = user.picture;
        if(!user.picture.contains("https"))
        {
           pictureURL = user.picture.replacingOccurrences(of: "http", with: "https")
        }
        self.imageURL = URL(string: pictureURL)
        super.init()
        
        self.setDetails(buttontag: .LOCATION)
        
    }
    
    func setDetails(buttontag:BOTTOM_BUTTON_TAG)
    {
        switch buttontag {
        case .CALENDER:
            title = "My Date Of Birth"
                      info = user.dob
            break
        case .LOCATION:
            title = "My Address"
            info = user.location.street + " " + user.location.city + " " + user.location.state
               break;
        case .LOCK:
            title = "Is My Profile locked"
            info = "No"
               break;
        case .PHONE:
            title = "My Contact"
            info = user.cell
               break;
        case .PROFILE:
            title = "My Name is"
            info = user.name.first + " " + user.name.last
            break;
        }
    }
    

}
