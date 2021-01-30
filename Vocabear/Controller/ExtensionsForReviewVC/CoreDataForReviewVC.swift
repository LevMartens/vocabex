//
//  CoreDataForReviewVC.swift
//  Vocabear
//
//  Created by Lev Martens on 29/1/21.
//

import Foundation

extension ReviewVC {
    

    

    
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
            print("A")
            self.savedWordsCoreDataObject[0].words = self.savedWords
            print("\(String(describing: savedWordsCoreDataObject[0].words))")
            
            do {
                try self.context.save()
            } catch {
                print(error)
                
            }
        }
        
        
    }
    
}

