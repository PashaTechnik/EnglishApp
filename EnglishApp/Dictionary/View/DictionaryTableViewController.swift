//
//  DictionaryTableViewController.swift
//  EnglishApp
//
//  Created by Pasha on 18.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit

class DictionaryTableViewController: UITableViewController {
    
    var viewModel: TableViewModelType?
    
    var Dictionary: [String:String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController as! MainTabBar
        self.Dictionary = tabbar.user?.dictionary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.Dictionary = CurrentUser.Dictionary
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel?.numberOfRows ?? 0
        return Dictionary?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        let word = Array(Dictionary ?? [:])[indexPath.row]
        
        tableViewCell.word.text = word.key
        tableViewCell.translate.text = word.value
    
        return tableViewCell
    }
    

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let word = Array(Dictionary ?? [:])[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            NetworkManager.deleteWordInDictionary(key: word.key)
            self.Dictionary = CurrentUser.Dictionary
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         return true
     }
    
    @IBAction func exitAction(_ segue: UIStoryboardSegue) { }
}
