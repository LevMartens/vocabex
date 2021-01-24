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

class MainViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var dimView: UIView!
    
    var newBlueView: UIView!
    let addB = UIButton(frame: CGRect(x: 20, y: 60, width: 25, height: 30))
    let scannerButton = UIButton(frame: CGRect(x:350, y:60, width:25,height:30))
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    //let customAlert = MyAlert()
    let appBarViewController = MDCAppBarViewController()
   
    
    private let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    //let NSManagedObject = BookAndWordManager.shared.coreDataManager.managedObjectContext
    
//    var currentBook: Book? {
//        didSet { addBImageUpdateAfterLaunch() }
//    }
    
    
    var array: [String] = []
    
    
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNewBlueView()
        
        setupTableView()
        
        setupObservers()
        
        setupVision()
       
//        BookAndWordManager.shared.fetchBooks()
//        BookAndWordManager.shared.fetchWords()
//        BookAndWordManager.shared.fetchDeletedWords()
        
//        dropDownView.isHidden = true
//        dimView.isHidden = true
       
       
    }
    // MARK: Book added and image added to addB
    
//    func addBImageUpdateAfterLaunch() {
//
//        if let currentBook = currentBook {
//            guard let cover = UIImage(data: currentBook.cover!) else {return}
//
//        addB.setImage(cover, for: .normal)
//        }
//    }
//
//    @objc func booksDidFinishLaunching(notification: NSNotification) {
//
//         if let dict = notification.userInfo as NSDictionary? {
//             if let id = dict["book"] as? [Book] {
//                 self.currentBook = id[0]
//                print("\(currentBook)" )
//
//                }}
//
//
//     }
    
//    @objc func addBImageUpdateAfterAdd(notification: NSNotification) {
//        print("addB fired")
//        if let dict = notification.userInfo as NSDictionary? {
//        if let id = dict["book"] as? Book{
//            print("this is id \(id)")
//            currentBook = id
//            print("this is current book \(currentBook)")
//
//        }}
//
//    }
  
    
    
    // MARK: ScannerButton and Scanner
    
    @objc func scannerButtonTapped() {
          let scannerViewController = VNDocumentCameraViewController()
          scannerViewController.delegate = self
          present(scannerViewController, animated: true)
          
      }
   private func setupVision() {
       textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
           guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
           
           var detectedText = ""
           for observation in observations {
               guard let topCandidate = observation.topCandidates(1).first else { return }
               print("text \(topCandidate.string) has confidence \(topCandidate.confidence)")
   
               detectedText += topCandidate.string
               detectedText += "\n"
               
            print("detectedText called \(detectedText)")
           
           }
           
           DispatchQueue.main.async {
               
            let arrayA = FilterProcess.shared.startFilter(page: detectedText)
            self.array += arrayA
            self.tableView.reloadData()
            


           }
       }

       textRecognitionRequest.recognitionLevel = .accurate
   }
   
   private func processImage(_ image: UIImage) {
//       imageV.image = image
       recognizeTextInImage(image)
   }
   
   private func recognizeTextInImage(_ image: UIImage) {
       guard let cgImage = image.cgImage else { return }
       
      // textV.text = ""
       textRecognitionWorkQueue.async {
           let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
           do {
               try requestHandler.perform([self.textRecognitionRequest])
           } catch {
               print(error)
           }
       }
   }
   
   func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
       guard scan.pageCount >= 1 else {
           controller.dismiss(animated: true)
           return
       }
       
       let originalImage = scan.imageOfPage(at: 0)
       let newImage = compressedImage(originalImage)
       controller.dismiss(animated: true)
       
       processImage(newImage)
    
    controller.dismiss(animated: true, completion: nil)
   }
  
    
   func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
       print(error)
       controller.dismiss(animated: true)
   }
   
   func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
       controller.dismiss(animated: true)
   }

   func compressedImage(_ originalImage: UIImage) -> UIImage {
       guard let imageData = originalImage.jpegData(compressionQuality: 1),
           let reloadedImage = UIImage(data: imageData) else {
               return originalImage
       }
       return reloadedImage
   }
  
    // MARK: AddButton and DropDownView

    
    
//    @objc func buttonAction(notification: NSNotification) {
//
//        if addB.currentImage == #imageLiteral(resourceName: "notenew") {
//
//            //customAlert.showAlert(with: "blkbl", message: "fvdsfv", on: self)
//        }
//
//
//
//        if addB.currentImage != #imageLiteral(resourceName: "notenew") {
//           if (dropDownView.isHidden == true ) {
//
//               openDropDownView()
//           }
//           else { closeDropDownViewA() }
//
//           if (dropDownView.isHidden == true) {dimView.isHidden = true}
//           else {dimView.isHidden = false}
//
//           let currentWindow: UIWindow? = UIApplication.shared.keyWindow
//           currentWindow?.addSubview(dimView)
//
//           let currentWindowA: UIWindow? = UIApplication.shared.keyWindow
//           currentWindow?.addSubview(dropDownView)
//
//           let currentWindowB: UIWindow? = UIApplication.shared.keyWindow
//            currentWindow?.addSubview(newBlueView) }
//
//
//       }
//
//
//
//     func openDropDownView() {
//        self.dropDownView.isHidden = false
//        UIApplication.shared.keyWindow?.bringSubviewToFront(newBlueView)
//
//
//        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
//
//          var fabricTopFrame = self.dropDownView.frame
//          fabricTopFrame.origin.y -= fabricTopFrame.size.height
//
//          var fabricBottomFrame = self.dropDownView.frame
//          fabricBottomFrame.origin.y += fabricBottomFrame.size.height
//
//          self.dropDownView.frame = fabricTopFrame
//          self.dropDownView.frame = fabricBottomFrame
//
//
//            UIView.animate(withDuration: 0.5) {
//                self.dimView.alpha = 0.75
//            }
//
//
//
//        }, completion: { finished in
//          print("Napkins opened!")
//        })
//    }
//
//   @objc func closeDropDownView(notification: NSNotification) {
//
//          UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
//
//              var fabricTopFrame = self.dropDownView.frame
//              var fabricBottomFrame = self.dropDownView.frame
//
//            fabricTopFrame.origin.y += fabricBottomFrame.size.height
//            fabricBottomFrame.origin.y -= fabricTopFrame.size.height
//
//            self.dropDownView.frame = fabricTopFrame
//            self.dropDownView.frame = fabricBottomFrame
//
//              UIView.animate(withDuration: 0.5) {
//                  self.dimView.alpha = 0
//
//              }
//
//
//
//
//          }, completion: { finished in
//              self.dropDownView.isHidden = true
//
//            print("dropView closed!")
//
////            if let dict = notification.userInfo as NSDictionary? {
////            if let id = dict["book"] as? Book{
////                self.currentBook = id
////                print(self.currentBook)
//////                let theCover = UIImage(data: id.cover!)
//////                if self.addB.currentImage != theCover {
//////                    self.addB.setImage(theCover, for: .normal) }
////
////            }}
//
//
//      })
//    }
//
//     func closeDropDownViewA() {
//
//           UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
//
//               var fabricTopFrame = self.dropDownView.frame
//               var fabricBottomFrame = self.dropDownView.frame
//
//             fabricTopFrame.origin.y += fabricBottomFrame.size.height
//             fabricBottomFrame.origin.y -= fabricTopFrame.size.height
//
//             self.dropDownView.frame = fabricTopFrame
//             self.dropDownView.frame = fabricBottomFrame
//
//               UIView.animate(withDuration: 0.5) {
//                   self.dimView.alpha = 0
//
//               }
//
//           }, completion: { finished in
//               self.dropDownView.isHidden = true
//             print("dropView closed!")
//           })
//       }
    
    
}

