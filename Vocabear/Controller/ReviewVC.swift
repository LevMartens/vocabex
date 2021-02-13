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
        
        savedWords.append("ambience")
        savedWords.append("indefinitely")
        savedWords.append("vigilante")
        savedWords.append("subjective")
        savedWords.append("objective")
        savedWords.append("frantic")
        savedWords.append("console")
        savedWords.append("malice")
        savedWords.append("penultimate")
        savedWords.append("bog")
        savedWords.append("dignify")
        savedWords.append("mural")
        savedWords.append("clavicle")
        savedWords.append("tinge")
        savedWords.append("defer")
        savedWords.append("sustenance")
        
        buildUI()
        
        setupTableView()
        
    }
  
    
   
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisapear")
        updateMainVC()
    }
   
    
    

}
