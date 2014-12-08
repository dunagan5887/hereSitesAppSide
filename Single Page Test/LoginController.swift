//
//  LoginController.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/7/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation
import UIKit

class LoginController: ViewController
{
    @IBOutlet weak var executeLoginButton: UIButton!
    
    
    @IBAction func executeLogin(sender: UIButton, forEvent event: UIEvent)
    {
        var login_success = self.executeLoginAttempt();
        
        if (login_success)
        {
            self.transitionToEstablishLocationController();
        }
    }
    
    func transitionToEstablishLocationController()
    {
        let establishLocationController = self.storyboard!.instantiateViewControllerWithIdentifier("EstablishLocationController") as EstablishLocationController;
        
        let navigationController = self.navigationController!;
        
        navigationController.pushViewController(establishLocationController, animated: true);
    }
    
    func executeLoginAttempt() -> Bool
    {
        // For now simulate success
        return true;
    }
}