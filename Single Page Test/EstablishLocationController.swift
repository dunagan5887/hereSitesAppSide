//
//  establishLocationController.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/7/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation
import UIKit

class EstablishLocationController: ViewController
{
    
    @IBOutlet weak var signOutButton: UIButton!
    
    @IBOutlet weak var establishLocationButton: UIButton!
    
    @IBAction func executeSignOut(sender: UIButton, forEvent event: UIEvent)
    {
        self.transitionToLoginController();
    }
    
    @IBAction func executeEstablishLocation(sender: UIButton, forEvent event: UIEvent)
    {
        self.transitionToLocationHereController();
    }
    
    func transitionToLoginController()
    {
        let loginController = self.storyboard!.instantiateViewControllerWithIdentifier("LoginController") as LoginController;
        
        let navigationController = self.navigationController!;
        
        navigationController.pushViewController(loginController, animated: true);
    }
    
    func transitionToLocationHereController()
    {
        let locationHereController = self.storyboard!.instantiateViewControllerWithIdentifier("LocationHereController") as LocationHereController;
        
        let navigationController = self.navigationController!;
        
        navigationController.pushViewController(locationHereController, animated: true);
    }
}