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
        reviewTableView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let wordOnCell = savedWords[indexPath.row]
        cell.set(string: wordOnCell)
        cell.backgroundColor = #colorLiteral(red: 0.1333333333, green: 0.2, blue: 0.262745098, alpha: 1)
        
        return cell
    }
      
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let saveWord = saveWordAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [saveWord])
    }

    func saveWordAction(at indexpath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Save") { [self] (action, view, completion) in
        
//        let wordToSave = self.currentWords[indexpath.row]
//        self.savedWords.append(wordToSave)
//        self.savedWordsToCoreData()
//        self.currentWords.remove(at: indexpath.row)
//        self.tableView.deleteRows(at: [indexpath], with: .automatic)


        }
        action.backgroundColor = .green

        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteWord = deleteWordAction(at: indexPath)

        return UISwipeActionsConfiguration(actions: [deleteWord])
    }
    
    func deleteWordAction(at indexpath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
//            self.currentWords.remove(at: indexpath.row)
//            self.tableView.deleteRows(at: [indexpath], with: .automatic)
            
        }
        action.backgroundColor = .red
        
        return action
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
        
    }
    

    
    
}
