//
//  TableViewForReviewVC.swift
//  Vocabear
//
//  Created by Lev Martens on 28/1/21.
//

import Foundation
import UIKit
import CoreData

extension ReviewVC: UITableViewDelegate, UITableViewDataSource {
    

    
    
    
    
    
    
    //move this function into a build ui file
    func setupTableView() {
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let wordOnCell = savedWords[indexPath.row]
        cell.set(string: wordOnCell)
        
        
        return cell
    }
      
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteWord = deleteWordAction(at: indexPath)

        return UISwipeActionsConfiguration(actions: [deleteWord])
    }
    
    func deleteWordAction(at indexpath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.savedWords.remove(at: indexpath.row)
            self.savedWordsToCoreData()
            self.updateMainVC()
            self.reviewTableView.deleteRows(at: [indexpath], with: .automatic)
            
        }
        action.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.1725490196, blue: 0.2549019608, alpha: 1)
        
        return action
    }
    
    
    
    
    

    
    
}
