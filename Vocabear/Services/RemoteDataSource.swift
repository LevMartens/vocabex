//
//  RemoteDataSource.swift
//  Vocabear
//
//  Created by Lev Martens on 6/3/21.
//

import Foundation
import UIKit
import MaterialComponents.MaterialAppBar
import MaterialComponents
import Firebase

class RemoteDataSource {
    let dataBase = Firestore.firestore()
    var fireStoreDelegate: FireStoreDelegate!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    lazy var mainVC = storyboard.instantiateViewController(withIdentifier: "Main") as! MainViewController
    
    
    init() {}
    
    
    func getWordListsFromCloudFS()  {
        dataBase.collection("RootWordList").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        
                        let data = document.data()
                        
                        self.fireStoreDelegate.get(data: data)
                        
                    }
                    
                }
        }
    }
    
}
    

