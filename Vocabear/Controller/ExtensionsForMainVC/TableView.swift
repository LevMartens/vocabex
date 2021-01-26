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
        tableView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let blabla = currentWords[indexPath.row]
        cell.set(string: blabla)
        cell.backgroundColor = #colorLiteral(red: 0.1333333333, green: 0.2, blue: 0.262745098, alpha: 1)
        
        return cell
    }
      
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let saveWord = saveWordAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [saveWord])
    }

    func saveWordAction(at indexpath: IndexPath) -> UIContextualAction {
       let action = UIContextualAction(style: .destructive, title: "Save") { (action, view, completion) in
        
        let wordToSave = self.currentWords[indexpath.row]
        self.savedWords.append(wordToSave)
        
        if self.wordsSaved == false {
            let newList = SavedWords(context: self.context)
            
            //context.delete(savedWordsCoreDataObject[0])
            
            newList.words = self.savedWords

            do {
                try self.context.save()
            } catch {
                print(error)
            }
            
        } else {
            
            self.savedWordsCoreDataObject[0].words = self.savedWords
            
            do {
                try self.context.save()
            } catch {
                print(error)
                
            }
        }
        
        


                self.currentWords.remove(at: indexpath.row)
                self.tableView.deleteRows(at: [indexpath], with: .automatic)



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
            self.currentWords.remove(at: indexpath.row)
            self.tableView.deleteRows(at: [indexpath], with: .automatic)
            
        }
        action.backgroundColor = .red
        
        return action
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
        
    }
    

    
    
}
