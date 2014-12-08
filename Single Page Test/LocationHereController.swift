//
//  LocationHereController.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/7/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation
import UIKit


class LocationHereController : ViewController
{
    var hereablesAtLocation = ["Sean", "Remy", "Brendan", "Leah"]
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.hereablesAtLocation.count;
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        cell.textLabel!.text = self.hereablesAtLocation[indexPath.row]
        
        return cell
    }
}



/*
class LocationHereController : ViewController
{
    var hereablesAtLocation = ["Sean", "Remy", "Brendan", "Leah"]
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.hereablesAtLocation.count;
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        cell.textLabel!.text = self.hereablesAtLocation[indexPath.row]
        
        return cell
    }
}*/