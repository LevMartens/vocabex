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
}
