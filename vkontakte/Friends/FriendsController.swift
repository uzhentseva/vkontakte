//
//  FriendsController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

@IBDesignable class FriendsController: UITableViewController {
    
    struct Section {
        let letter : String
        let names : [String]
    }
    
    var friendsArray = [
        "Rachel",
        "Monika",
        "Phoebe",
        "Ross",
        "Chandler",
        "Joe",
        "Janice",
        "Jill"]
    
    var friendsPicArray = [
        UIImage(named: "rachel.png")!,
        UIImage(named: "monika.png")!,
        UIImage(named: "phoebe.png")!,
        UIImage(named: "ross.png")!,
        UIImage(named: "chandler.png")!,
        UIImage(named: "joe.png")!,
        UIImage(named: "janice.png")!,
        UIImage(named: "jill.png")!]
    
    var sections = [Section]()
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero
    @IBInspectable var shadowOpacity: Float = 0.6
    @IBInspectable var shadowRadius: CGFloat = 5
    @IBInspectable var shadowColor: UIColor = UIColor.gray
    
    let recievedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groupedDictionary = Dictionary(grouping: friendsArray, by: {String($0.prefix(1))})
        // get the keys and sort them
        let keys = groupedDictionary.keys.sorted()
        // map the sorted keys to a struct
        sections = keys.map{ Section(letter: $0, names: groupedDictionary[$0]!.sorted()) }
        
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].names.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return sections.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map{$0.letter}
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friendsArray.count
//    }
    
    
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
        
        let section = sections[indexPath.section]
        let username = section.names[indexPath.row]
        
        //let friend = friendsArray[indexPath.row]
        let friendPic = friendsPicArray[indexPath.row]
        
        //cell.allFriends.text = friend
        cell.friendImage.image = friendPic
        cell.textLabel?.text = username
        
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
                
                let friendName = friendsArray[indexPath.row]
                let friendImage = friendsPicArray[indexPath.row]
                
                secondVC.myFriendNames = [friendName]
                secondVC.myFriendPicture = [friendImage]
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
