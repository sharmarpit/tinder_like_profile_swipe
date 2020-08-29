//
//  ImageDownLoadService.swift
//  tabexampleApp
//
//  Created by arpit sharma on 23/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation
import UIKit
class ImageDownLoadService: NSObject {

static let shared = ImageDownLoadService()

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
           URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
       }
       
   open func downloadImage(from url: URL, imageView:UIImageView) {
           print("Download Started")
           getData(from: url) { data, response, error in
               guard let data = data, error == nil else { return }
               DispatchQueue.main.async() { [weak self] in
                   imageView.image = UIImage(data: data)
                    imageView.layer.cornerRadius
                        = (imageView.frame.size.width)/2
                   imageView.clipsToBounds = true

                   imageView.layer.borderColor = UIColor.white.cgColor
                   imageView.layer.borderWidth = 5.0
               }
           }
       }
       
}
