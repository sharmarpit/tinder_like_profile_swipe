//
//  ProfileTableViewCellView.swift
//  tabexampleApp
//
//  Created by arpit sharma on 23/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation
import UIKit

class ProfileTableViewCellView: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var backView: UIView!

    var viewModel:ProfileTableViewCellViewModel?
    func setUPCell(cellViewModel:ProfileTableViewCellViewModel)
    {
        viewModel = cellViewModel
        ImageDownLoadService.shared.downloadImage(from: (viewModel?.profileImageURL)!, imageView: profileImage)
        profileName.text = viewModel?.userName
    }
    
    
}
