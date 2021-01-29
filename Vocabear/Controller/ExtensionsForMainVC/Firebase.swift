//
//  Firebase.swift
//  Vocabear
//
//  Created by Lev Martens on 26/1/21.
//

import Foundation

extension MainViewController {
    
    func getWordListsFromFireBase() {
        dataBase.collection("RootWordList").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                
                    for document in querySnapshot!.documents {
                        
                        let data = document.data()
                        
                        if let fetchedRootWords = data["RootWords"] as? [String] {
                            self.rootWordList = fetchedRootWords
                            
                        }
                        if let fetchedRootWordsPlural = data["RootWordsPlural"] as? [String] {
                            self.rootWordListPlural = fetchedRootWordsPlural
                            
                        }
                        
                        if let fetchedRootWordsPrefix = data["RootWordsWithPrefix"] as? [String] {
                            self.rootWordListPrefix = fetchedRootWordsPrefix
                            
                        }
                        if let fetchedRootWordsSuffix = data["RootWordsWithSuffix"] as? [String] {
                            self.rootWordListSuffix = fetchedRootWordsSuffix
                            
                        }
                        
                        
                    }
                    self.wordList = WordListFilter(rootWordList: self.rootWordList, rootWordListPlural: self.rootWordListPlural, rootWordListSuffix: self.rootWordListSuffix, rootWordListPrefix: self.rootWordListPrefix)
                    
                    self.filterProcess = FilterProcess(wordsToFilterOut: self.wordList)
                    
                }
        }
        
    }
}
