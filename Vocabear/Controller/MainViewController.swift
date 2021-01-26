//
//  ViewController.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
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



class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var dimView: UIView!
    
    let db = Firestore.firestore()
    var newBlueView: UIView!
    let addB = UIButton(frame: CGRect(x: 20, y: 60, width: 25, height: 30))
    let scannerButton = UIButton(frame: CGRect(x:350, y:60, width:25,height:30))
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    //let customAlert = MyAlert()
    let appBarViewController = MDCAppBarViewController()
    
    var rootWordListPrefix: [String] = []
    var rootWordListSuffix: [String] = []
    var rootWordListPlural: [String] = []
    var rootWordList: [String] = []
    var wordList: WordListFilter
    var filterProcess: FilterProcess
    var wordsSaved = false
    
    
    
    
    
    required init?(coder: NSCoder) {
        
        self.wordList = WordListFilter(rootWordList: [], rootWordListPlural: [], rootWordListSuffix: [], rootWordListPrefix: [])
        self.filterProcess = FilterProcess(wordsToFilterOut: wordList)
        
        super.init(coder: coder)
        
    }
    
    
    let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    
    var currentWords: [String] = []
    var savedWordsCoreDataObject: [SavedWords] = []
    var savedWords: [String] = []
    
    
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        getSavedWordsFromCoreData()
        
        getWordListsFromFireBase()
       
        setupNewBlueView()
        
        setupTableView()
        
        setupObservers()
        
        setupVision()
       
       
       
    }
 
    
    
    
    @objc func scannerButtonTapped() {
          let scannerViewController = VNDocumentCameraViewController()
          scannerViewController.delegate = self
          present(scannerViewController, animated: true)
          
      }


    
}

