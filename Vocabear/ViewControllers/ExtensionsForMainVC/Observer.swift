//
//  Observers.swift
//  Vocabear
//
//  Created by Lev Martens on 29/1/21.
//

import Foundation
import UIKit

extension MainViewController {
    
    
    func setupObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getDataFromReviewVC), name: Notification.Name("sendDataToMainVC"), object: nil)
    }
    
    @objc func getDataFromReviewVC(notification: NSNotification){
        if let dict = notification.userInfo as NSDictionary? {
            
         if let savedWordsFromReviewVC = dict["savedWords"] as? [String]{
            
            savedWords = savedWordsFromReviewVC
            
        
         }
         if let coreDataObjectFromReviewVC = dict["coreDataObject"] as? [SavedWords]{
                
            savedWordsCoreDataObject = coreDataObjectFromReviewVC
                
            
         }
            
        }
        print("getDataFromReviewVC called savedwords: \(savedWords) ")
        
    }
    
    
}
