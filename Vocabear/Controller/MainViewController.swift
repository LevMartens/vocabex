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
        
        let i = "be is am are was were been beat beat beaten become became become begin began begun bend bent bent bet bet bet bid bid bid bite bit bitten blow blew blown break broke broken bring brought brought build built built burn burned burnt burned burnt buy bought bought catch caught caught choose chose chosen come came come cost cost cost cut cut cut dig dug dug dive dove dived do did done draw drew drawn dream dreamed dreamt dreamed dreamt drive drove driven drink drank drunk eat ate eaten fall fell fallen feel felt felt fight fought fought find found found fly flew flown forget forgot forgotten forgive forgave forgiven freeze froze frozen get got gotten give gave given go went gone grow grew grown hang hung hung have had had hear heard heard hide hid hidden hit hold held held hurt hurt hurt keep kept kept know knew known lay laid laid lead led led leave left left lend lent lent let let let lie lay lain lose lost lost make made made mean meant meant meet met met pay paid paid put read ride rode ridden ring rang rung rise rose risen run ran run say said said see saw seen sell sold sold send sent sent show showed shown shut shut shut sing sang sung sit sat sat sleep slept slept speak spoke spoken spend spent spent stand stood stood swim swam swum take took taken teach taught taught tear tore torn tell told told think thought thought throw threw thrown understand understood understood wake woke woken wear wore worn win won won write wrote written"
        let iLowerCase = i.lowercased()
        let op = iLowerCase.components(separatedBy: [" "])
        dataBase.collection("RootWordList").document("Irregular").setData([
            "Irregular": op,

        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        
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

