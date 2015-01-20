//
//  LocationHereController.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/7/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation
import UIKit

class LocationHereController : ViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var LocationHereTableInstance: LocationHereTable!
    
    var hereablesAtLocation : Array<Dictionary<String, String>> = Array<Dictionary<String, String>>();
    
    var navControllerToPushOnto : UINavigationController?;
    
    func setNavControllerToPushOnto(navControllerInstance : UINavigationController)
    {
        self.navControllerToPushOnto = navControllerInstance;
    }
    
    func processUsersAtLocationData(usersAtLocationDictionary : Dictionary<String, String>)
    {
        self.loadHereablesIntoTable(usersAtLocationDictionary);
    }
    
    func loadHereablesIntoTable(usersAtLocationDictionary : Dictionary<String, String>)
    {
        // MUST shouldn't clear self.hereablesAtLocation until we're sure we have data
        self.hereablesAtLocation = Array<Dictionary<String, String>>();
        var dataForUsersAtLocationKeys : Array<String> = ["status", "username", "name", "age", "gender"];
        
        for (user_id, user_data_json_string) in usersAtLocationDictionary
        {
            var userDataAsDictionary = JsonUtility.parseJSONStringAsDictionary(user_data_json_string, json_keys_to_grab : dataForUsersAtLocationKeys);
            
            self.hereablesAtLocation.append(userDataAsDictionary);
            
            println(userDataAsDictionary);
        }
        
        self.transitionToThisController();
    }
    
    func transitionToThisController()
    {
        self.navControllerToPushOnto!.pushViewController(self, animated : false);
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count = self.hereablesAtLocation.count;
        return count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:LocationHereTableCell = LocationHereTableCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell");
        
        var userHereableDataDictionary = self.hereablesAtLocation[indexPath.row]
        
        println(userHereableDataDictionary);
        println(cell);
        
        // MUST ensure that the dictionary contains the values below
        
        cell.statusLabel!.text = userHereableDataDictionary["status"];
        cell.ageLabel!.text = userHereableDataDictionary["age"];
        cell.genderLabel!.text = userHereableDataDictionary["gender"];
        cell.nameLabel!.text = userHereableDataDictionary["name"];
        
        println(cell.statusLabel!.text);
        
        return cell
    }
}
