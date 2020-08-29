//
//  UserService.swift
//  statusneo_project
//
//  Created by arpit sharma on 18/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation

class UserService: NSObject {
    
    static let shared = UserService()
    var userServiceResponseDataModel:UserServiceResponseDataModel? = nil;
    let baseURL: URL
    
    
    //User Operations
    private var currentUser:User? = nil;
    private var favUsers: Array<User> = Array()
    
    private override init()
       {
        self.baseURL = URL(string:"https://randomuser.me/api/0.4/?randomapi")!
        super.init()
        retriveFavUserToUserDefault()
       }
    
    public func RequestUserProfiles()
    {
      let task = URLSession.shared.dataTask(with: baseURL, completionHandler: { (data, response, error) in
        
        if(error == nil)
        {
            self.userServiceResponseDataModel =  try! JSONDecoder().decode(UserServiceResponseDataModel.self, from: data!)
                   print(self.userServiceResponseDataModel!.results.first?.seed ?? "Not found")
            self.setCurrentUser(user: self.userServiceResponseDataModel?.results.first?.user)
            NotificationCenter.default.post(name: Notification.Name("downLoadComplete"), object: nil)
        }
       
    
        })

        task.resume()
    }
    
        //User Operations
    func getCurrentUser() -> User? {
        return currentUser;
    }
    func setCurrentUser(user:User?) {
         currentUser = user;
    }
    func setFavUser(user:User!)
    {
        favUsers.append(user);
        saveFavUserToUserDefault()
        
    }
    func getFavUsers() -> Array<User> {
        return favUsers;
    }
    
    func saveFavUserToUserDefault()
    {
   
        UserDefaults.standard.set(try? PropertyListEncoder().encode(favUsers), forKey:"favUsers")
    }
    func retriveFavUserToUserDefault()
       {
        if let savedData = UserDefaults.standard.value(forKey: "favUsers")
           {
            if let data = savedData as? Data {
              let  users = try? PropertyListDecoder().decode(Array<User>.self, from: data)
                favUsers = users!
            }
    }
}
}
