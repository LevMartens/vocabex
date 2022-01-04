//
//  SavedWordsModel.swift
//  Vocabear
//
//  Created by Lev Martens on 6/3/21.
//

import Foundation

class SavedWordsModel {
    
    var coreDataDelegate: CoreDataDelegate!
    var localDataSource = LocalDataSource()
    
    var savedWordsArray: [String] = []
    
    
    init(){
        
        localDataSource.coreDataDelegate = self
        
        localDataSource.getSavedWordsFromCoreData()
        
    }
    
    func save(words: [String]) {
        
        localDataSource.saveWordsToCoreData(list: words)
    }
    
    
}

extension SavedWordsModel: CoreDataDelegate {
    
    func get(data: [String])  {
        savedWordsArray = data
    }
    
}
