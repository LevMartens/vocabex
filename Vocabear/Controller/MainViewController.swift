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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataBase = Firestore.firestore()
    let appBarViewController = MDCAppBarViewController()
    let addB = UIButton(frame: CGRect(x: 20, y: 60, width: 25, height: 30))
    let scannerButton = UIButton(frame: CGRect(x:350, y:60, width:25,height:30))
    let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    //let customAlert = MyAlert()
    
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    var newBlueView: UIView!
    var rootWordListPrefix: [String] = []
    var rootWordListSuffix: [String] = []
    var rootWordListPlural: [String] = []
    var rootWordList: [String] = []
    var wordList: WordListFilter
    var filterProcess: FilterProcess
    var wordsSaved = false
    var currentWords: [String] = []
    var savedWordsCoreDataObject: [SavedWords] = []
    var savedWords: [String] = []
    
    
    
    
    required init?(coder: NSCoder) {
        
        self.wordList = WordListFilter(rootWordList: [], rootWordListPlural: [], rootWordListSuffix: [], rootWordListPrefix: [])
        self.filterProcess = FilterProcess(wordsToFilterOut: wordList)
        
        super.init(coder: coder)
        
    }
    
    
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        NotificationCenter.default.addObserver(self, selector: #selector(dataBack), name: Notification.Name("sidft"), object: nil)
        

        getSavedWordsFromCoreData()
        
        getWordListsFromFireBase()
       
        setupNewBlueView()
        
        setupTableView()
        
        setupObservers()
        
        setupVision()
       
       
       
    }
 
    @objc func dataBack(notification: NSNotification){
        print("a")
        if let dict = notification.userInfo as NSDictionary? {
        if let id = dict["book"] as? [String]{
            print("this is id \(id)")
            savedWords = id
            print("this is savedbook after back \(savedWords)")
            
        }}
    }
    
    
    @objc func scannerButtonTapped() {
          let scannerViewController = VNDocumentCameraViewController()
          scannerViewController.delegate = self
          present(scannerViewController, animated: true)
          
      }
    
    @objc func addTapped() {
        
        print(savedWords)
    }

    @IBAction func scanButton(_ sender: UIBarButtonItem) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ReviewVC {
                viewController.savedWords = self.savedWords
            }
    }

    
}

