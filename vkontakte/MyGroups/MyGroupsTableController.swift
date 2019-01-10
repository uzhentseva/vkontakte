//
//  MyGroupsTableController.swift
//  vkontakte
//
//  Created by Uzh on 10/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class MyGroupsTableController: UITableViewController {
    
    var myGroupChoiceName = [String]()
    var myGroupChoicePic = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupChoiceName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCellId", for: indexPath) as! MyGroupsTableCell

        let myGroupName = myGroupChoiceName[indexPath.row]
        let myGroupPic = myGroupChoicePic[indexPath.row]
        
        cell.MyGroupLable.text = myGroupName
        cell.MyGroupImage.image = myGroupPic

        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupChoiceName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


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
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {

            let allGroupsController = segue.source as! GroupsController
            
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                
                let group = allGroupsController.allGroupsArray[indexPath.row]
                let image = allGroupsController.allGroupPictureArray[indexPath.row]
                
                if !myGroupChoiceName.contains(group){
                    myGroupChoicePic.append(image)
                    myGroupChoiceName.append(group)
                     tableView.reloadData()
                }
                
                tableView.reloadData()
            }
        }
    }

    @IBAction func logoutMyGroups(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
