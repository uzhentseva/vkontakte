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

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {

            let allGroupsController = segue.source as! GroupsController
            
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                
                let group = allGroupsController.allGroupsArray[indexPath.row].name
                let image = UIImage(named: allGroupsController.allGroupsArray[indexPath.row].image)
                
                if !myGroupChoiceName.contains(group){
                    
                    myGroupChoiceName.append(group)
                    myGroupChoicePic.append(image!)
                    
                     tableView.reloadData()
                }
            }
        }
    }

    @IBAction func logoutMyGroups(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
