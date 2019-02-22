//
//  MyFriendAllPictures.swift
//  vkontakte
//
//  Created by Uzh on 21/02/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class MyFriendAllPictures: UIViewController {
    
    var photos: [UIImage] = []
    
    @IBOutlet weak var AllImages: UIImageView!
    
    var index = 0
    var friendImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addPictures()
        
        AllImages.image = UIImage(named: "\(photos)")
        
        //self.swipeGestures()
    }
    
    
    
    func addPictures() {
        for i in 0...photos.count {
            let index = photos.count
            photos.append(UIImage(named: "chandler-\(index - 1).jpg")!)
        }
    }
    
    
    
    
    
    func swipeGestures() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if index == photos.count - 1 {
                    index = 0
                } else {
                    index += 1
                }
                
                //AllImages.image = UIImage(named: photos[index])
            case UISwipeGestureRecognizer.Direction.right:
                if index == 0 {
                    index = photos.count - 1
                } else {
                    index -= 1
                }
                //AllImages.image = UIImage(named: photos[index])
            default:
                break
            }
        }
        
    }
    
    func swipeRight() {
        
    }
    
    func swipeLeft() {
        
    }
    
    
    
}



//        if let imageToLoad = photos {
//            AllImages.image  = UIImage(named: imageToLoad)
//        }


