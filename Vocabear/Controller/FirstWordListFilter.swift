//
//  FirstWordListFilter.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation

class FirstWordListFilter {
    
    var prefix = [String]()
    var rest = [String]()
    var pluralArray = [String]()
    var fwlfArray = [String]()
    
    
    func startFilter(wordList: [String]) -> [String]{
        
        var page = wordList
        
        var aNumber = 0
        
        
        for _ in 1...fwlfArray.count {

           page = page.filter { $0 != fwlfArray[aNumber] }
           
            aNumber += 1
        }
        
        var bNumber = 0
        
        for _ in 1...pluralArray.count {

           page = page.filter { $0 != pluralArray[bNumber] }
           
            bNumber += 1
        }
        
        var cNumber = 0
        
        for _ in 1...rest.count {

           page = page.filter { $0 != rest[cNumber] }
           
            cNumber += 1
        }
        
        var dNumber = 0
        
        for _ in 1...prefix.count {

           page = page.filter { $0 != prefix[dNumber] }
           
            dNumber += 1
        }
        
        
        
        
        return page
        
    }
    
}
