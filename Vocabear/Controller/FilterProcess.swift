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
    
        
    var wordsToFilterOut: WordListFilter
    
    init(wordsToFilterOut: WordListFilter) {
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
            

            page = page.filter { $0 != wordsToFilterOut.namesAndCountryList[fNumber] }
           
            kNumber += 1
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
            print("pagecount: \(page.count)")
            print("inumber: \(iNumber)")
            if page[iNumber].hasSuffix("-") {
                page.remove(at: iNumber)
                page.remove(at: iNumber)
                print("inside pagecount: \(page.count)")
                print("inside inumber: \(iNumber)")
                iNumber = iNumber - 2
                if iNumber == -1 {iNumber = 0}
            } else {iNumber += 1}
            
        }
        
        var jNumber = 0
        
        for _ in 1...page.count {
            if page[jNumber].hasPrefix("-") {
                page.remove(at: jNumber)
                
            } else {jNumber += 1}
            
        }
        
        
        
        
        return page
        
    }
    

    
    
  
    
    
    private func cleanUpTextForFiltering(page: String) -> [String] {
        
        let textString = page
        print(page)
        let textStringLowerCased = textString.lowercased()
        print(textStringLowerCased)
        let takeOutCommas = textStringLowerCased.replacingOccurrences(of: ",", with: "")
        let periodsTakenOut = takeOutCommas.replacingOccurrences(of: ".", with: "")
        let takeOutPrenthesisClosing = periodsTakenOut.replacingOccurrences(of: ")", with: "")
        let takeOutParenthesisOpen = takeOutPrenthesisClosing.replacingOccurrences(of: "(", with: "")
        let takeOutA = takeOutParenthesisOpen.replacingOccurrences(of: "\"", with: "")
        let takeOutB = takeOutA.replacingOccurrences(of: "\'s", with: "")
        let takeOutC = takeOutB.replacingOccurrences(of: ";", with: "")
        let takeOutD = takeOutC.replacingOccurrences(of: "\'re", with: "")
        let takeOutE = takeOutD.replacingOccurrences(of: "n\'t", with: "")
        let takeOutF = takeOutE.replacingOccurrences(of: "?", with: "")
        let takeOutG = takeOutF.replacingOccurrences(of: "»", with: "")
        let takeOutH = takeOutG.replacingOccurrences(of: ":", with: "")
        let takeOutI = takeOutH.replacingOccurrences(of: "{", with: "")
        let takeOutJ = takeOutI.replacingOccurrences(of: "]", with: "")
        let takeOutK = takeOutJ.replacingOccurrences(of: "[", with: "")
        let takeOutL = takeOutK.replacingOccurrences(of: "|", with: "")
        let takeOutM = takeOutL.replacingOccurrences(of: "«", with: "")
        let takeOutN = takeOutM.replacingOccurrences(of: "\'ve", with: "")
        let takeOutO = takeOutN.replacingOccurrences(of: "\'", with: "")
        let takeOutP = takeOutO.replacingOccurrences(of: "!", with: "")
        let takeOutQ = takeOutP.replacingOccurrences(of: "*", with: "")
        let cleanUp = takeOutQ.replacingOccurrences(of: "$", with: "")
        var seperateWords = cleanUp.components(separatedBy: [" "])
        
        print("clean: \(seperateWords)")
        
        var oNumber = 0
        print("count before \(seperateWords.count)")
        for _ in 1...seperateWords.count {
            print("before n check \(seperateWords[oNumber])")
        if seperateWords[oNumber].contains("\n") {
            print("ckeck is true \(seperateWords[oNumber]) will be split")
            let ip = seperateWords[oNumber].replacingOccurrences(of: "\n", with: " ")
            print("before array \(ip)")
            let op = ip.components(separatedBy: [" "])
            print("after array \(op)")
            seperateWords.append(contentsOf: op)
            seperateWords.remove(at: oNumber)
        } else {oNumber += 1}
            
        }
        print("oNumber count \(oNumber)")
        print("count after for in \(seperateWords.count)")
        let filteredWords = startFiltering(wordList: seperateWords)
        print(filteredWords)
        
        let filterResults = Array(Set(filteredWords))
        
        print(filterResults)
        
    
    return filterResults
        
    }

    
    
    
    
    
    
    
    
    
   
  
    
    
}


