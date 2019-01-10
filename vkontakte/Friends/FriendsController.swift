//
//  FriendsController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController {
    
    var friendsArray = [
        "Rachel",
        "Monika",
        "Phoebe",
        "Ross",
        "Chandler",
        "Joe"]
    
    var friendsPicArray = [
        UIImage(named: "rachel.png")!,
        UIImage(named: "monika.png")!,
        UIImage(named: "phoebe.png")!,
        UIImage(named: "ross.png")!,
        UIImage(named: "chandler.png")!,
        UIImage(named: "joe.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        
        let friend = friendsArray[indexPath.row]
        let friendPic = friendsPicArray[indexPath.row]
        
        cell.allFriends.text = friend
        cell.friendImage.image = friendPic
        
        return cell
    }
    
    
    
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendToPic" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let friend = friendsArray[indexPath.row]
                let image = friendsPicArray[indexPath.row]
                
                let secondVC: MyFriendsCollectionController = segue.destination as! MyFriendsCollectionController
                
                secondVC.myFriendNames = friend
                secondVC.myFriendPicture = image
                
                
            }
        }
    }
    
    
}
