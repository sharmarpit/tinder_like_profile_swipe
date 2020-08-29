//
//  HomeViewController.swift
//  statusneo_project
//
//  Created by arpit sharma on 18/08/20.
//  Copyright © 2020 arpitsharma. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    override func awakeFromNib() {
        
    }
    var viewModel:HomeViewModel?
    var currentProfileView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(onDownLoadComplete), name: NSNotification.Name("downLoadComplete"), object: nil)
        }

    @objc func onDownLoadComplete(notification: NSNotification)
        {
           DispatchQueue.main.async { [unowned self] in
            
            if let porofileViewModel = self.viewModel?.getUpProfileViewModel()
            {
                let profileView = ProfileView.instanceFromNib() as! ProfileView
                    profileView.setupView(viewModel: porofileViewModel)
                self.view.addSubview(profileView)
                profileView.center = CGPoint(x: self.view.frame.size.width  / 2,
                y: self.view.frame.size.height / 2)
                self.addSwipeGesture(view: profileView);
                self.currentProfileView = profileView
            }
           
            }
        }
    
    func addSwipeGesture(view:UIView)
    {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
                      let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
                      
                      leftSwipe.direction = .left
                      rightSwipe.direction = .right

                      view.addGestureRecognizer(leftSwipe)
                      view.addGestureRecognizer(rightSwipe)
    }
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
       {
           if sender.direction == .left
           {
             animateView(direction: "left", view: self.currentProfileView!)
              // show the view from the right side
           }

           if sender.direction == .right
           {
            viewModel?.addUserToFavList()
            animateView(direction: "right", view: self.currentProfileView!)
           
              // show the view from the left side
           }
       }
    
    func animateView(direction:String, view:UIView)
    {
        var distance = self.view.frame.width;
        if(direction.elementsEqual("right"))
        {
           distance = self.view.frame.width;
            
        }else{
            distance = -self.view.frame.width;
        }
        UIView.animate(withDuration:0.5, delay: 0, options: .transitionCurlDown, animations: {
                       view.frame = CGRect(x: distance, y:  self.view.center.y - view.frame.height/2, width: view.frame.width, height:view.frame.height)

                   }, completion:{(isDone) in
                    self.currentProfileView?.removeFromSuperview();
                    self.viewModel?.downloadNewProfile()
                   } )
    }
    
}
