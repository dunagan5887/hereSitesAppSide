//
//  LocationHereableTableCell.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/8/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation
import UIKit

class LocationHereTableCell : UITableViewCell
{
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    func loadItem(#name: String, image:String)
    {
        self.backgroundImage.image = UIImage(named: image)
        self.nameLabel.text = name
    }
}