//
//  ProfileView.swift
//  tabexampleApp
//
//  Created by arpit sharma on 21/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation
import UIKit


class ProfileView: UIView , UITabBarDelegate{
    
    @IBOutlet weak var tabBarView: UITabBar!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var UserProfileImage: UIImageView!
    @IBOutlet weak var infoLable: UILabel!
    
    var profileViewModel:ProfileViewModel? = nil;
    override class func awakeFromNib() {
      
    }
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ProfileView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
       }
    
    func setupView(viewModel:ProfileViewModel) {
        profileViewModel = viewModel;
        tabBarView.delegate = self
        tabBarView.selectedItem = tabBarView.items![2]
        
        ImageDownLoadService.shared.downloadImage(from: profileViewModel!.imageURL!,imageView: UserProfileImage)
        self.setUpStrings()
      
    }
    
   
    func setUpStrings() {
        titleLable.text = profileViewModel?.title
        infoLable.text = profileViewModel?.info
    }

    
    func tabBar(_ tabBar: UITabBar,
    didSelect item: UITabBarItem)
    {
       
        profileViewModel?.setDetails(buttontag: BOTTOM_BUTTON_TAG(rawValue: item.tag)!)
        setUpStrings()
        print("ARPIT" + String(item.tag))
    }
    
    
   
    
}
