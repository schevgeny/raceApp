//
//  ResultCell.swift
//  race
//
//  Created by Eugene sch on 8/24/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

   
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var expLabel: UILabel?
    
    func set(model: Result){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd.MM.yyyy"
        
        self.nameLabel?.text = model.name
        self.expLabel?.text = String(model.exp)
        self.dateLabel?.text = formatter.string(from: model.date)
    }

}
