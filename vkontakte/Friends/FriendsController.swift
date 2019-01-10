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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "friendToPic" {
//
//            let photoFriendsController : MyFriendsCollectionController = segue.destination as! MyFriendsCollectionController
//            let myFriendsController = segue.source as! FriendsController
//
//            //  Получаем индекс выделенной ячейки
//            if let indexPath = myFriendsController.tableView.indexPathsForSelectedRows {
//
//                // Получаем друга по индексу
//                let friend = myFriendsController.friendsArray[indexPath[0].row]
//                if let fotoDelegate = myFriendsController.friendsPicArray[friend] as? [String] {
//                    
//                    photoFriendsController.fotoDelegate = fotoDelegate
//                    print(photoFriendsController.fotoDelegate)
//                }
//            }
//        }
//    }
}


/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

