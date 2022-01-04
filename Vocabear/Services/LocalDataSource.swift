//
//  CoreData.swift
//  Vocabear
//
//  Created by Lev Martens on 26/1/21.
//

import Foundation
import UIKit
import CoreData
import MaterialComponents.MaterialAppBar
import MaterialComponents

class LocalDataSource {
    
    var coreDataDelegate: CoreDataDelegate!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //var savedWordsCoreDataObject: [SavedWords] = []
    var savedWordsCoreDataObject: [SavedWords] = []
    
    
    init(){}
    
    
    func getSavedWordsFromCoreData() {
        
        do {
            
             savedWordsCoreDataObject = try context.fetch(SavedWords.fetchRequest()) as! [SavedWords]
            if savedWordsCoreDataObject.count == 0 {
                print("CoreData is empty")

            } else {
                if savedWordsCoreDataObject[0].words!.isEmpty {
                
                print("CoreData is empty")
            } else {
                
                print("CoreData Fetched!")
                
                self.coreDataDelegate.get(data: savedWordsCoreDataObject[0].words!)
                
            }
                
            }
            
        } catch {print(error)}
        
        
    }
    
    func saveWordsToCoreData(list: [String]) {
        
        
        
        
        if savedWordsCoreDataObject.count == 0 {
            
            
            let t = SavedWords(context: self.context)
            t.words = list
            savedWordsCoreDataObject = [t]

        } else {
            
            self.savedWordsCoreDataObject[0].words = list
        }
        
        print("YYYY")
            do {
                try self.context.save()
            } catch {
                print(error)
            }
        }
    }
    

