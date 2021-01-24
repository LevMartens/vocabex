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
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let blabla = array[indexPath.row]
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
            
//            print("saveword tapped \(self.currentBook)")
//
//            if let theBook = self.currentBook {
//            print(theBook)
//
//
//            let theWord = Word(context: self.NSManagedObject)
//            print(theWord)
//
//                theWord.book = theBook
//                theWord.word = self.array[indexpath.row]
//                theWord.favourite = false
//                theWord.definition = "put definition here when you fixed that"
//                theWord.createdAt = Date()
//                print(theWord.book ?? "no Book")
//                print(theWord.word ?? "no Word")
//                print(theWord.favourite)
//                print(theWord.definition ?? "no Definition")
//
//                FilterProcess.shared.personalWords.append(self.array[indexpath.row])
//                self.array.remove(at: indexpath.row)
//                self.tableView.deleteRows(at: [indexpath], with: .automatic)
//
//            }


        }
//        action.backgroundColor = .green

        return action
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteWord = deleteWordAction(at: indexPath)

        return UISwipeActionsConfiguration(actions: [deleteWord])
    }
    
    func deleteWordAction(at indexpath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
//
//
//
//            let theDeletedWord = DeletedWord(context: self.NSManagedObject)
//            theDeletedWord.deletedWord = self.array[indexpath.row]
//            theDeletedWord.createdAt = Date()
//            print(theDeletedWord.deletedWord ?? "no word here")
//
//            FilterProcess.shared.personalWords.append(self.array[indexpath.row])
//            self.array.remove(at: indexpath.row)
//            self.tableView.deleteRows(at: [indexpath], with: .automatic)
//
//
//
            
        }
       // action.backgroundColor = .red
        
        return action
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
        
    }
    

    
    
}
