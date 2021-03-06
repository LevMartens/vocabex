//
//  TableView.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation
import UIKit
import CoreData

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    

    

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let wordOnCell = currentWords[indexPath.row]
        cell.set(string: wordOnCell)
        
        
        return cell
    }
    
      
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let saveWord = saveWordAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [saveWord])
    }

    func saveWordAction(at indexpath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Save") { [self] (action, view, completion) in
        
        let wordToSave = self.currentWords[indexpath.row]
        self.savedWords.append(wordToSave)
        self.savedWordsToCoreData()
        self.currentWords.remove(at: indexpath.row)
        self.tableView.deleteRows(at: [indexpath], with: .automatic)


        }
        action.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)

        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteWord = deleteWordAction(at: indexPath)

        return UISwipeActionsConfiguration(actions: [deleteWord])
    }
    
    func deleteWordAction(at indexpath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.currentWords.remove(at: indexpath.row)
            self.tableView.deleteRows(at: [indexpath], with: .automatic)
            
        }
        action.backgroundColor = #colorLiteral(red: 0.7803921569, green: 0.1725490196, blue: 0.2549019608, alpha: 1)
        
        return action
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "wordDetail")
        self.present(vc, animated: true)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    

    
    
}
