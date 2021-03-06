//
//  TableViewCell.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
   var label = UILabel(frame: CGRect(x: 15, y: 12, width: 350, height: 20))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(label)
        self.backgroundColor = #colorLiteral(red: 0.2235294118, green: 0.2431372549, blue: 0.2745098039, alpha: 1)
        self.layer.opacity = 0.5
        
    }
    
    func set(string: String){
        label.text = string
        label.font = UIFont(name:"HiraMinProN-W3",size:18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
        
    }
    
    
}
