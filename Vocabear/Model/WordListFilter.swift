//
//  FirstWordListFilter.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation

class WordListFilter {
    
    var rootWordListPrefix: [String]
    var rootWordListSuffix: [String]
    var rootWordListPlural: [String]
    var rootWordList: [String]
    var oddWordsAndNames: [String]
    var rootWordListPast: [String]
    var namesAndCountryList: [String]
    
    init(namesAndCountryList: [String], rootWordListPast: [String], oddWordsAndNames: [String], rootWordList: [String], rootWordListPlural: [String], rootWordListSuffix: [String], rootWordListPrefix: [String] ) {
        self.rootWordList = rootWordList
        self.rootWordListPlural = rootWordListPlural
        self.rootWordListPrefix = rootWordListPrefix
        self.rootWordListSuffix = rootWordListSuffix
        self.oddWordsAndNames = oddWordsAndNames
        self.rootWordListPast = rootWordListPast
        self.namesAndCountryList = namesAndCountryList
    }
    
    
}
