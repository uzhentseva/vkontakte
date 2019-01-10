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
    
    
//    @IBOutlet weak var FriendImage: UIImageView!
//    @IBOutlet weak var NameLabel: UILabel!
    
    var myFriendNames = String()
    var myFriendPicture = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        FriendImage.image = myFriendPicture
//        NameLabel.text = myFriendNames

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}
