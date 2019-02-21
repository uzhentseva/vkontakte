//
//  MyFriendsCollectionCell.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class MyFriendsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var myFriendPic: UIImageView!
    @IBOutlet weak var myFriendsName: UILabel!

    
    override func awakeFromNib() {
       // self.animateIt()
        self.addGestures()
    }
    
    
//    func animateIt() {
//        let animation = CASpringAnimation(keyPath: "transform.scale")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.stiffness = 200
//        animation.mass = 2
//        animation.duration = 2
//        animation.beginTime = CACurrentMediaTime() + 0.2
//        animation.fillMode = CAMediaTimingFillMode.backwards
//
//        self.myFriendPic.layer.add(animation, forKey: nil)
//    }
    
        func addGestures() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
    
            self.addGestureRecognizer(tapGesture)
        }
    
        @objc private func tapAction(tap: UITapGestureRecognizer) {
            print("tapGesture")
    
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.fromValue = 0
            animation.toValue = 1
            animation.stiffness = 200
            animation.mass = 2
            animation.duration = 1.5
            animation.beginTime = CACurrentMediaTime() + 0.3
            animation.fillMode = CAMediaTimingFillMode.backwards
    
            myFriendPic.layer.add(animation, forKey: nil)
    
        }
    

}
