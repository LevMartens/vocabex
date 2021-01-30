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
            if savedWordsCoreDataObject.count == 0 {
                print("CoreData is empty")
                
            } else {
                if savedWordsCoreDataObject[0].words!.isEmpty {
                
                print("CoreData is empty")
            } else {
                
                savedWords = savedWordsCoreDataObject[0].words!
                print("savedWords: \(savedWords)")
            }}
            
            
            
        } catch {print(error)}
        
    }
    
    func savedWordsToCoreData() {
        
        if savedWordsCoreDataObject[0].words!.isEmpty {
            let newList = SavedWords(context: self.context)
            
            newList.words = self.savedWords
            
            savedWordsCoreDataObject[0] = newList

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
