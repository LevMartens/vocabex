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
    
        
    let firstWordList = FirstWordListFilter()
    
    static let shared = FilterProcess(name: "IDontKnowWhatToPutHere")
    
    var name: String
    
    private init(name: String){
       self.name = name
       }
    
    func setupObservers(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(toPersonalWords), name: Notification.Name("fetchedWordsToFilter"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(dToPersonalWords), name: Notification.Name("fetchedDWordsToFilter"), object: nil)
        
    }
    
    
    func startFilter(page: String) -> [String] {
        
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
        
        let filtered = firstWordList.startFilter(wordList: seperateWords)
        print(filtered)
        let secondFiltered = personalFilter(filtered)
        print(secondFiltered)
        
        
        let noDouble = Array(Set(secondFiltered))
        
        print(noDouble)
        
    
    let resultsFilter1 = noDouble
    return resultsFilter1
        
    }

    
    var personalWords = ["and", "that", "sometimes", "the"]
    
    
    
    
    
    
    
    func personalFilter(_ wordList: [String]) -> [String] {
        
        var page = wordList
        
        var eNumber = 0
        
        for _ in 1...personalWords.count {

           page = page.filter { $0 != personalWords[eNumber] }
           
            eNumber += 1
        }
        
        return page
        
        
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


