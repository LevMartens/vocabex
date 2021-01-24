//
//  TableViewCell.swift
//  Vocabear
//
//  Created by Lev Martens on 24/1/21.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(string: String){
        label.text = string
    }
    
}
