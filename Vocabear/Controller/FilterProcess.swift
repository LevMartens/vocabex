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
        
        
        
        
        return page
        
    }
    

    
    
    private func setupObservers(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(toPersonalWords), name: Notification.Name("fetchedWordsToFilter"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dToPersonalWords), name: Notification.Name("fetchedDWordsToFilter"), object: nil)
        
    }
    
    
    private func cleanUpTextForFiltering(page: String) -> [String] {
        
        let textString = page
        print(page)
        let textStringLowerCased = textString.lowercased()
        print(textStringLowerCased)
        let takeOutCommas = textStringLowerCased.replacingOccurrences(of: ",", with: "")
        let periodsTakenOut = takeOutCommas.replacingOccurrences(of: ".", with: "")
        let cleanUp = periodsTakenOut.replacingOccurrences(of: "\'s", with: "")
        var seperateWords = cleanUp.components(separatedBy: [" "])
        
        print(seperateWords)
        
        var oNumber = 0
        
        for _ in 1...seperateWords.count {
        if seperateWords[oNumber].contains("\n") {
            let ip = seperateWords[oNumber].replacingOccurrences(of: "\n", with: " ")
            print(ip)
            let op = ip.components(separatedBy: [" "])
            print(op)
            seperateWords.append(contentsOf: op)
            seperateWords.remove(at: oNumber)
        }
            oNumber += 1
        }
        
        let filteredWords = startFiltering(wordList: seperateWords)
        print(filteredWords)
        
        let filterResults = Array(Set(filteredWords))
        
        print(filterResults)
        
    
    return filterResults
        
    }

    
    
    
    
    
    
    
    
    
   
   
    @objc func toPersonalWords(notification: NSNotification) {
        
//        if let dict = notification.userInfo as NSDictionary? {
//            if let id = dict["word"] as? [Word] {
//
//                var number = 0
//
//                for _ in 1...id.count {
//
//                    personalWords.append(id[number].word ?? "no word")
//                    number += 1
//                }
//
//
//
//               }}
        
        
        
    }

    @objc func dToPersonalWords(notification: NSNotification) {
        
//        if let dict = notification.userInfo as NSDictionary? {
//        if let id = dict["dWord"] as? [DeletedWord] {
//
//            var number = 0
//
//            for _ in 1...id.count {
//
//                personalWords.append(id[number].deletedWord ?? "no word")
//                number += 1
//            }
//
//
//
//           }}
        
    }
    
    
}


