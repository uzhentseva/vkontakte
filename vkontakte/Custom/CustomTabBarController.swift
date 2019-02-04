//
//  CustomTabBarController.swift
//  vkontakte
//
//  Created by Uzh on 04/02/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//



// -------- doesn't work properly



//
//import Foundation
//import UIKit
//
//class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
//
//    var friendsVC: FriendsController!
//    var myGroupsVC: MyGroupsTableController!
//    var newsVC: NewsController!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.delegate = self
//
//        friendsVC = FriendsController()
//        myGroupsVC = MyGroupsTableController()
//        newsVC = NewsController()
//
//        friendsVC.tabBarItem.image = UIImage(named: "friends")
//        friendsVC.tabBarItem.selectedImage = UIImage(named: "friends")
//
//        myGroupsVC.tabBarItem.image = UIImage(named: "star")
//        myGroupsVC.tabBarItem.selectedImage = UIImage(named: "star")
//
//        newsVC.tabBarItem.image = UIImage(named: "pics")
//        newsVC.tabBarItem.selectedImage = UIImage(named: "pics")
//
//        viewControllers = [friendsVC, myGroupsVC, newsVC]
//        for tabBarItem in tabBar.items! {
//            tabBarItem.title = ""
//            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }
//    }
//
//    //MARK: UITabbar Delegate
//
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//
//        if viewController.isKind(of: ActionViewController.self) {
//
//            let vc =  ActionViewController()
//            vc.modalPresentationStyle = .overFullScreen
//            self.present(vc, animated: true, completion: nil)
//            return false
//        }
//        return true
//    }
    
//}
