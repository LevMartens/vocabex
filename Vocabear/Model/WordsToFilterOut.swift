//
//  FirstWordListFilter.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation

class WordsToFilterOut {
    
    var fireStoreDelegate: FireStoreDelegate!
    var remoteDataSource = RemoteDataSource()
    var rootWordListPrefix: [String] = []
    var rootWordListSuffix: [String] = []
    var rootWordListPlural: [String] = []
    var rootWordList: [String] = []
    var oddWordsAndNames: [String] = []
    var rootWordListPast: [String] = []
    var namesAndCountryList: [String] = []
    var rootIrregular: [String] = []
    
    init(){
        
        remoteDataSource.fireStoreDelegate = self
        
        remoteDataSource.getWordListsFromCloudFS()
        
    }
    
    
    
    
}

extension WordsToFilterOut: FireStoreDelegate {
    
    func get(data: [String : Any])  {
        print("BBB")
        
        if let fetchedRootIrregular = data["Irregular"] as? [String] {
            self.rootIrregular = fetchedRootIrregular
        }
        
        if let fetchedNamesAndCountries = data["NamesAndCountries"] as? [String] {
            self.namesAndCountryList = fetchedNamesAndCountries
        }
        
        if let fetchedRootWordsPast = data["RootWordsPast"] as? [String] {
            self.rootWordListPast = fetchedRootWordsPast
        }
        
        if let fetchedOddWordsAndNames = data["OddWordsAndNames"] as? [String] {
            self.oddWordsAndNames = fetchedOddWordsAndNames
        }
        
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
}

