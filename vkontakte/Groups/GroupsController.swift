//
//  GroupsController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit

class GroupsController: UITableViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allGroupsArray = [
    "Family",
    "Singers",
    "Married",
    "Working"]
    
    //var filteredGroups = [allGroupsArray]()
    
    var allGroupPictureArray = [
        UIImage(named: "Family.png")!,
        UIImage(named: "Singers.png")!,
        UIImage(named: "Married.png")!,
        UIImage(named: "Working.png")!]
    
    //let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // Setup the Search Controller
//        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search Groups"
//        navigationItem.searchController = searchController
//        definesPresentationContext = true

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupsCell

        let groupName = allGroupsArray[indexPath.row]
        let groupPic = allGroupPictureArray[indexPath.row]
        
        cell.GroupLable.text = groupName
        cell.GroupImage.image = groupPic

        return cell
    }
    
    // MARK: - Private instance methods
    
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
    
//    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//
//        filteredGroups = allGroupsArray.filter({( group : allGroupsArray) -> Bool in
//            return group.name.lowercased().contains(searchText.lowercased())
//        })
//
//}
}

//extension GroupsController: UISearchResultsUpdating {
//
//    // MARK: - UISearchResultsUpdating Delegate
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContentForSearchText(searchController.searchBar.text!)
//
//    }
//}

