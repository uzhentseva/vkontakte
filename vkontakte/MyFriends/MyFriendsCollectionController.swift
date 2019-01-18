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
    
    var myFriendNames = [String]()
    var myFriendPicture = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Вот следующие строчки необходимо было закомментировать!!!
        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myFriendCell", for: indexPath) as? MyFriendsCollectionCell else {
            fatalError("Cannot create 'My Friend Cell'")
        }
        
        let friendN = myFriendNames[indexPath.row]
        let friendP = myFriendPicture[indexPath.row]
        
        cell.myFriendsName.text = friendN
        cell.myFriendPic.image = friendP
        
        return cell
    }
    
}
