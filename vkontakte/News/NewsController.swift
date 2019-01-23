//
//  NewsController.swift
//  vkontakte
//
//  Created by Uzh on 18/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class NewsController: UICollectionViewController {
    
    
    var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    // Хранит атрибуты для заданных индексов
    
    var columnsCount = 2                  // Количество столбцов
    
    var cellHeight: CGFloat = 128         // Высота ячейки
    
    private var totalCellsHeight: CGFloat = 0 // Хранит суммарную высоту всех ячеек
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare() {
     self.cacheAttributes = [:] // Инициализируем атрибуты
     
     // Проверяем налачие collectionView
     guard let collectionView = self.collectionView else { return }
     
     let itemsCount = collectionView.numberOfItems(inSection: 0)
     // Проверяем, что в секции есть хотя бы одна ячейка
     guard itemsCount > 0 else { return }
     
     }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCell
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
