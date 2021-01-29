//
//  ReviewVC.swift
//  Vocabear
//
//  Created by Lev Martens on 28/1/21.
//

import UIKit

class ReviewVC: UIViewController {
    
    var savedWords: [String] = []


    
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      print("in vc \(savedWords)")
        savedWords.append("terr")
        setupTableView()
        let bookDataDict:[String: [String]] = ["book": savedWords]
        NotificationCenter.default.post(name: Notification.Name("sidft"), object: nil, userInfo: bookDataDict)
    }
  
    
   
    
   
    
    

}
