//
//  NewsController.swift
//  vkontakte
//
//  Created by Uzh on 18/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

//------ JUST TESTING LAYOUTS
//struct NewsPost {
//    var newsPic: UIImage? {
//        return UIImage(named: "\(newsTitle.lowercased()).jpeg")
//    }
//    let newsTitle: String
//}


class NewsController: UICollectionViewController {
    
    //var news: [NewsPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

       // news = [NewsPost(newsTitle: "Rosa")]
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
//        let post = self.news[indexPath.row]
//
//        //cell.newsPicture.image = post.newsPic
//        cell.newsTitle?.text = post.newsTitle
//        cell.newsPicture = post.newsPic as? NewsImage
    
        return cell
    }
    
    
    
    

}
