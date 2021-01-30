//
//  Vision.swift
//  Vocabear
//
//  Created by Lev Martens on 26/1/21.
//

import Foundation
import UIKit
import Foundation
import UIKit
import VisionKit
import Vision

extension MainViewController: VNDocumentCameraViewControllerDelegate {
    
    func startVisionScanner() {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = self
        present(scannerViewController, animated: true)
    }
   
    
     func setupVision() {
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
                
             
             let arrayA = self.filterProcess.getFilterResults(wordList: detectedText)
             self.currentWords.append(contentsOf: arrayA)
             
             self.tableView.reloadData()
             


            }
        }

        textRecognitionRequest.recognitionLevel = .accurate
    }
    
    private func processImage(_ image: UIImage) {
 
        recognizeTextInImage(image)
    }
    
     private func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
       
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
}
