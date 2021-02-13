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
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataBase = Firestore.firestore()
    let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    var rootWordListPrefix: [String] = []
    var rootWordListSuffix: [String] = []
    var rootWordListPlural: [String] = []
    var rootWordListPast: [String] = []
    var rootWordList: [String] = []
    var rootIrregular: [String] = []
    var namesAndCountryList: [String] = []
    var oddWordsAndNames: [String] = []
    var wordList: WordListFilter
    var filterProcess: FilterProcess
    var currentWords: [String] = []
    var savedWordsCoreDataObject: [SavedWords] = []
    var savedWords: [String] = []
    
    
    
    
    required init?(coder: NSCoder) {
        
        self.wordList = WordListFilter(rootIrregular: [], namesAndCountryList: [], rootWordListPast: [], oddWordsAndNames: [], rootWordList: [], rootWordListPlural: [], rootWordListSuffix: [], rootWordListPrefix: [])
        self.filterProcess = FilterProcess(wordsToFilterOut: wordList)
        
        super.init(coder: coder)
        
    }
    
    
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWords.append("destiny")
        currentWords.append("tingle")
        currentWords.append("prodrude")
        currentWords.append("angelic")
        currentWords.append("bloating")
        currentWords.append("screening")
        currentWords.append("grumpy")
        currentWords.append("sensible")
        currentWords.append("slacking")
        currentWords.append("baffling")
        //Uncommend this code if you want to write large amount of data to firebase
        
//        let i = ""
//        let iLowerCase = i.lowercased()
//        let op = iLowerCase.components(separatedBy: [" "])
//        dataBase.collection("RootWordList").document("Irregular").setData([
//            "Irregular": op,
//
//        ]) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
        
        
        buildUI()
        
        getSavedWordsFromCoreData()
        
        getWordListsFromFireBase()
        
        setupObservers()
        
        setupTableView()
        
        setupVision()
        
        
       
       
       
    }
 
 
    @IBAction func clearCurrentWords(_ sender: UIBarButtonItem) {
        currentWords = []
        tableView.reloadData()
        
    }
    

    @IBAction func scanButton(_ sender: UIBarButtonItem) {
        startVisionScanner()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let reviewVC = segue.destination as? ReviewVC {
            reviewVC.savedWords = self.savedWords
            reviewVC.savedWords = self.savedWords
            reviewVC.savedWordsCoreDataObject = self.savedWordsCoreDataObject
            let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
    }

    
}

