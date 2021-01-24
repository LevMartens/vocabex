//
//  BlueView.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation
import UIKit


extension MainViewController {
    
    
    func setupNewBlueView() {
        
        
        newBlueView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 100))
        newBlueView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        self.view.addSubview(newBlueView)
        
        
        
//        appBarViewController.view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//        
//        newBlueView.addSubview(appBarViewController.view)
        
        
//        let newPinkView = UIView(frame: CGRect(x: 0.0, y: 100, width: 500, height: 57))
//        newPinkView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
//        self.view.addSubview(newPinkView)
        
//        let pBottomBorder = CALayer()
//        let pThick: CGFloat = 2.0
//        pBottomBorder.frame = CGRect(x:0, y: newPinkView.frame.size.height - pThick, width: newPinkView.frame.size.width, height: pThick)
//        pBottomBorder.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4235294118, blue: 0.3803921569, alpha: 1)
//        //newPinkView.layer.addSublayer(pBottomBorder)
//
//
//        var seperator = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 37))
//        seperator.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.9568627451, blue: 0.9529411765, alpha: 1)
        //self.newBlueView.addSubview(seperator)
        
        let bottomBorder = CALayer()
        let thick: CGFloat = 2.0
        bottomBorder.frame = CGRect(x:0, y: newBlueView.frame.size.height - thick, width: newBlueView.frame.size.width, height: thick)
        bottomBorder.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.4235294118, blue: 0.3803921569, alpha: 1)
        newBlueView.layer.addSublayer(bottomBorder)
        
//        let label = UILabel(frame: CGRect(x: 80, y: 60, width: 200, height: 35))
//        label.text = "This is a Font"
//        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        label.textAlignment = .center
//        guard let customFont = UIFont(name: "Merriweather-Regular", size: 30) else {
//            fatalError("""
//                Failed to load the "CustomFont-Light" font.
//                Make sure the font file is included in the project and the font name is spelled correctly.
//                """
//            )
//        }
//        label.font = UIFontMetrics.default.scaledFont(for: customFont)
//        //label.adjustsFontForContentSizeCategory = true
//        
//        newBlueView.addSubview(label)
        
        addB.setImage(#imageLiteral(resourceName: "TextImage"), for: .normal)
        
        
        //addB.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.newBlueView.addSubview(addB)
        
        scannerButton.setImage(#imageLiteral(resourceName: "TextImage"), for: UIControl.State.normal)
        scannerButton.addTarget(self, action: #selector(scannerButtonTapped), for: UIControl.Event.touchUpInside)
        newBlueView.addSubview(scannerButton)
        
        
        
        //GIDSignIn.sharedInstance().signOut() implepen this in a logout butten somewhere later
        
        
    }
    
    
    
// NewBlueView is the view with the camera button on the right and the book button on the left
    
    
}

