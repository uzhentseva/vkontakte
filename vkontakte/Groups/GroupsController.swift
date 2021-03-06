//
//  GroupsController.swift
//  vkontakte
//
//  Created by Uzh on 09/01/2019.
//  Copyright © 2019 Uzh. All rights reserved.
//

import UIKit


class GroupsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var allGroupsArray = [Group]()
    var filteredGroups = [Group]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Groups"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Gellers", "Other"]
        searchController.searchBar.delegate = self
        
        allGroupsArray = [Group(name: "Family", category: "Gellers", image: "Family.png"),
                          Group(name: "Singers", category: "Other", image: "Singers.png"),
                          Group(name: "Married", category: "Other", image: "Married.png"),
                          Group(name: "Work", category: "Gellers", image: "Working.png")]

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredGroups.count
        }
        return allGroupsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupsCell
        
        let group = isFiltering() ? filteredGroups[indexPath.row] : allGroupsArray[indexPath.row]
        
        print("\(indexPath.row): \(group.name)")
        cell.GroupLable.text = group.name
        cell.GroupImage.image = UIImage(named: group.image)
        
        return cell
    }

    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredGroups = allGroupsArray.filter { (group : Group) -> Bool in
            let doesCategoryMatch = (scope == "All") || (group.category == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return group.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    
    func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }

}


class Group {
    let name: String
    let category: String
    let image: String
    
    init(name: String, category: String, image: String) {
        self.name = name
        self.image = image
        self.category = category
    }
}


extension GroupsController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }

}

extension GroupsController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}


