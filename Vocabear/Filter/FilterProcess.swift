//
//  FilterProcess.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation
import UIKit
import CoreData

class FilterProcess {
    
    var wordsToFilterOut: WordsToFilterOutModel
    let filter = Filter()
    
    init(wordsToFilterOut: WordsToFilterOutModel) {
        self.wordsToFilterOut = wordsToFilterOut
    }
    
    func getFilterResults(wordList: String) -> [String]{
        let cleanText = cleanUpTextForFiltering(page: wordList)
        let results = startFiltering(wordList: cleanText)
        
        return results
    }
    
    private func startFiltering(wordList: [String]) -> [String]{
        
        var page = wordList
        
        let root = filter.thisListOf(words: page, with: wordsToFilterOut.rootWordList)
        
        let plural = filter.thisListOf(words: root, with: wordsToFilterOut.rootWordListPlural)
        
        let suffix = filter.thisListOf(words: plural, with: wordsToFilterOut.rootWordListSuffix)
        
        let prefix = filter.thisListOf(words: suffix, with: wordsToFilterOut.rootWordListPrefix)
        
        let oddWords = filter.thisListOf(words: prefix, with: wordsToFilterOut.oddWordsAndNames)
        
        let past = filter.thisListOf(words: oddWords, with: wordsToFilterOut.rootWordListPast)
        
        let names = filter.thisListOf(words: past, with: wordsToFilterOut.namesAndCountryList)
        
        let irregular = filter.thisListOf(words: names, with: wordsToFilterOut.rootIrregular)
        
        page = filter.outDashes(words: irregular)
        
        return page
        
    }
    

    
    private func cleanUpTextForFiltering(page: String) -> [String] {
        
        let textString = page
        print(page)
        let textStringLowerCased = textString.lowercased()
        
        let takeOut = textStringLowerCased.replacingOccurrences(of: "[\",./)1234567890(;?»:{|}!«$•*]", with: "", options: .regularExpression, range: nil)
        
        let takeOutA = takeOut.replacingOccurrences(of: "\'re", with: "")
        let takeOutB = takeOutA.replacingOccurrences(of: "n\'t", with: "")
        let takeOutC = takeOutB.replacingOccurrences(of: "\'ve", with: "")
        let takeOutD = takeOutC.replacingOccurrences(of: "\'", with: "")
        var seperateWords = takeOutD.components(separatedBy: [" "])
        
        var oNumber = 0

        for _ in 1...seperateWords.count {

        if seperateWords[oNumber].contains("\n") {

            let ip = seperateWords[oNumber].replacingOccurrences(of: "\n", with: " ")

            let op = ip.components(separatedBy: [" "])

            seperateWords.append(contentsOf: op)
            seperateWords.remove(at: oNumber)
        } else {oNumber += 1}
            
        }

        let cleanedWords = seperateWords
        
        
    return cleanedWords
        
    }

}


