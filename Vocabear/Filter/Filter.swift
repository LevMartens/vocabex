//
//  Filter.swift
//  Vocabear
//
//  Created by Lev Martens on 6/3/21.
//

import Foundation


class Filter {
    
    
    func thisListOf(words: [String], with: [String]) -> [String]{
        
        
        var page = words
        var aNumber = 0
        
        for _ in 1...with.count {

            page = page.filter { $0 != with[aNumber] }
           
            aNumber += 1
        }
        
        return page
    }
    
    func outDashes(words: [String]) -> [String] {
        
        var page = words
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
    
}
