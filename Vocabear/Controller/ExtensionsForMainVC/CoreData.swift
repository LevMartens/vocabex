//
//  CoreData.swift
//  Vocabear
//
//  Created by Lev Martens on 26/1/21.
//

import Foundation

extension MainViewController {
    

    
    func getSavedWordsFromCoreData() {
        
        do {
            
            savedWordsCoreDataObject = try context.fetch(SavedWords.fetchRequest()) as! [SavedWords]
            if savedWordsCoreDataObject.isEmpty {
                wordsSaved = false
                print("is empty")
            } else {
                wordsSaved = true
                print(savedWordsCoreDataObject[0].words!)
                savedWords = savedWordsCoreDataObject[0].words!
                print(savedWords)
            }
            
            
        } catch {print(error)}
        
    }
    
    func savedWordsToCoreData() {
        
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
        
        
    }
}
