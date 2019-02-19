//
//  MyFriendsCollectionController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

let reuseIdentifier = "myFriendCell"

class MyFriendsCollectionController: UICollectionViewController {
    
    
    var myFriend = Friend(names: "a")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myFriendCell", for: indexPath) as? MyFriendsCollectionCell else {
            fatalError("Cannot create 'My Friend Cell'")
        }
        
        cell.myFriendsName.text = myFriend.names
        cell.myFriendPic.image = myFriend.avatar
        
        return cell
    }
    
    func CustomViewAnimation(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.alpha = 0
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
//    func addGestures() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
//
//        myFriendPic.addGestureRecognizer(tapGesture)
//    }
//
//    @objc private func tapAction(tap: UITapGestureRecognizer) {
//        print("tapGesture")
//
//        let animation = CASpringAnimation(keyPath: "transform.scale")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.stiffness = 200
//        animation.mass = 2
//        animation.duration = 2
//        animation.beginTime = CACurrentMediaTime() + 1
//        animation.fillMode = CAMediaTimingFillMode.backwards
//
//        //self.layer.add(animation, forKey: nil)
//
//    }


}
