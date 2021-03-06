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
        var aNumber = 0
        
        for _ in 1...wordsToFilterOut.rootWordList.count {

            page = page.filter { $0 != wordsToFilterOut.rootWordList[aNumber] }
           
            aNumber += 1
        }
        
        var bNumber = 0
        
        for _ in 1...wordsToFilterOut.rootWordListPlural.count {

            page = page.filter { $0 != wordsToFilterOut.rootWordListPlural[bNumber] }
           
            bNumber += 1
        }
        
        var cNumber = 0
        
        for _ in 1...wordsToFilterOut.rootWordListSuffix.count {

            page = page.filter { $0 != wordsToFilterOut.rootWordListSuffix[cNumber] }
           
            cNumber += 1
        }
        
        var dNumber = 0
        
        for _ in 1...wordsToFilterOut.rootWordListPrefix.count {

            page = page.filter { $0 != wordsToFilterOut.rootWordListPrefix[dNumber] }
           
            dNumber += 1
        }
        
        var eNumber = 0
        
        for _ in 1...wordsToFilterOut.oddWordsAndNames.count {
            
            page = page.filter { $0 != wordsToFilterOut.oddWordsAndNames[eNumber] }
           
            eNumber += 1
        }
        
        var fNumber = 0
        
        for _ in 1...wordsToFilterOut.rootWordListPast.count {
            
            page = page.filter { $0 != wordsToFilterOut.rootWordListPast[fNumber] }
           
            fNumber += 1
        }
        
        var kNumber = 0
        
        for _ in 1...wordsToFilterOut.namesAndCountryList.count {
            
            page = page.filter { $0 != wordsToFilterOut.namesAndCountryList[kNumber] }
           
            kNumber += 1
        }
        
        var lNumber = 0
        
        for _ in 1...wordsToFilterOut.rootIrregular.count {
            
            page = page.filter { $0 != wordsToFilterOut.rootIrregular[lNumber] }
           
            lNumber += 1
        }
        
        
        var gNumber = 0
        
        for _ in 1...page.count {
            if page[gNumber].contains("/") {
                page.remove(at: gNumber)
            } else {gNumber += 1}
            
        }
        
        var hNumber = 0
        
        let numbers = ["1","2","3","4","5","6","7","8","9","0"]
    
        for _ in 1...page.count {
            if numbers.contains(where: page[hNumber].contains) {
                page.remove(at: hNumber)
            } else {hNumber += 1}
            
        }
        
        var iNumber = 0
        
        for _ in 1...page.count {
            if page[iNumber].hasSuffix("-") {
                page.remove(at: iNumber)
                page.remove(at: iNumber)
                iNumber = iNumber - 2
                if iNumber == -1 {iNumber = 0}
                if iNumber == -2 {iNumber = 0}
            } else {iNumber += 1}
            
        }
        
        var jNumber = 0
        
        for _ in 1...page.count {
            if page[jNumber].hasPrefix("-") {
                page.remove(at: jNumber)
                
            } else {jNumber += 1}
            
        }
        
        var mNumber = 0
        
        for _ in 1...page.count {
            if page[mNumber].hasPrefix("--") {
                page.remove(at: mNumber)
                
            } else {mNumber += 1}
            
        }
        
        return page
        
    }
    

    
    private func cleanUpTextForFiltering(page: String) -> [String] {
        
        let textString = page
        print(page)
        let textStringLowerCased = textString.lowercased()
        
        let takeOut = textStringLowerCased.replacingOccurrences(of: "[\",.)(;?»:{|}!«$•*]", with: "", options: .regularExpression, range: nil)
        
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


