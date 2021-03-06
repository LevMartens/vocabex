//
//  ObserverForReviewVC.swift
//  Vocabear
//
//  Created by Lev Martens on 29/1/21.
//

import Foundation

extension ReviewVC {
    
    func updateMainVC() {
        let savedWordsDataDict:[String: [Any]] = ["savedWords": self.savedWords]
        NotificationCenter.default.post(name: Notification.Name("sendDataToMainVC"), object: nil, userInfo: savedWordsDataDict)
        
    }
}
