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
    
    let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    var wordList = WordsToFilterOutModel()
    var filterProcess: FilterProcess
    var currentWords: [String] = []
    var savedWordsModel = SavedWordsModel()
    var wordsToSave: [String] = []
    
    
    required init?(coder: NSCoder) {
        
        self.filterProcess = FilterProcess(wordsToFilterOut: wordList)
        
        super.init(coder: coder)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buildUI()
        
        wordsToSave = savedWordsModel.savedWordsArray
        
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
            reviewVC.savedWords = self.wordsToSave
            reviewVC.savedWords = self.wordsToSave
            let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
    }

    
}

