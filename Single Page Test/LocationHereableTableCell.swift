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
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    func loadItem(hereableDataDictionary : Dictionary<String, String>)
    {
        // MUST ensure that the dictionary contains the values below
        
        statusLabel!.text = hereableDataDictionary["status"];
        titleLabel!.text = hereableDataDictionary["name"];
        genderLabel!.text = hereableDataDictionary["gender"];
        ageLabel!.text = hereableDataDictionary["age"];
    }
    
    /*
    func loadItem(#name: String, image:String)
    {
        self.backgroundImage.image = UIImage(named: image)
        self.nameLabel.text = name
    }
*/
}