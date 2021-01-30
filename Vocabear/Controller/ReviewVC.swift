//
//  ReviewVC.swift
//  Vocabear
//
//  Created by Lev Martens on 28/1/21.
//


import UIKit
import Foundation
import UIKit
import VisionKit
import Vision
import CoreData
import MaterialComponents.MaterialAppBar
import MaterialComponents
import Firebase

class ReviewVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataBase = Firestore.firestore()
    var savedWords: [String] = []
    var wordsSaved = false
    var savedWordsCoreDataObject: [SavedWords] = []


    
    @IBOutlet weak var reviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedWords.append("peanutbutter")
        savedWords.append("examination")
        savedWords.append("vocabulary")
        savedWords.append("penis")
        
        buildUI()
        
        setupTableView()
        
    }
  
    
   
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisapear")
        updateMainVC()
    }
   
    
    

}
