//
//  FriendsController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.

import UIKit

struct Section {
    
    let names : String
    var avatar: UIImage? {
        return UIImage(named: "\(names.lowercased()).png")
    }
    var letter: Character {
        return names.first as! Character
    }

}

@IBDesignable class FriendsController: UITableViewController {
    
    
    var friends: [Section] = []
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero
    @IBInspectable var shadowOpacity: Float = 0.6
    @IBInspectable var shadowRadius: CGFloat = 5
    @IBInspectable var shadowColor: UIColor = UIColor.gray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friends = [
            Section(names: "Rachel"),
            Section(names: "Monika"),
            Section(names: "Phoebe"),
            Section(names: "Ross"),
            Section(names: "Chandler"),
            Section(names: "Joe"),
            Section(names: "Janice"),
            Section(names: "Jill")
        ]
        
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    // get the list of friends
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        
        if let outerView = cell.OuterView {
            outerView.clipsToBounds = false
            outerView.layer.shadowColor = self.shadowColor.cgColor
            outerView.layer.shadowOpacity = self.shadowOpacity
            outerView.layer.shadowOffset = self.shadowOffset
            outerView.layer.shadowRadius = self.shadowRadius
            outerView.backgroundColor = UIColor.clear
        }
        
        let friend = self.friends[indexPath.row]

        cell.friendImage.image = friend.avatar
        cell.allFriends?.text = friend.names
        
        return cell
    }
    
    @IBAction func logout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // transfer data to second view Collection Controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendToPic" {
            
            let secondVC: MyFriendsCollectionController = segue.destination as! MyFriendsCollectionController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                secondVC.myFriend = friends[indexPath.row]
                //secondVC.myFriendPicture = [friendImage]
            }
        }
    }
}


extension OuterView {
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}
