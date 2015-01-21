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
    let establish_at_location_uri = "here/establish";
    let users_at_location_key = "users_at_location_data";
    
    @IBOutlet weak var signOutButton: UIButton!
    
    @IBOutlet weak var establishLocationButton: UIButton!
    
    @IBOutlet weak var statusTextField: UITextField!
    var status_has_been_updated : Bool = false;
    
    @IBAction func executeSignOut(sender: UIButton, forEvent event: UIEvent)
    {
        self.transitionToLoginController();
    }
    
    @IBAction func statusBeginEdit(sender: UITextField)
    {
        if (!self.status_has_been_updated)
        {
            statusTextField.text = "";
        }
        self.status_has_been_updated = true;
        statusTextField.textColor = UIColor.blackColor();
    }
    
    @IBAction func executeEstablishLocation(sender: UIButton, forEvent event: UIEvent)
    {
        var user_status = statusTextField.text;
        
        // Make sure user entered a status
        if ((!self.status_has_been_updated)
            ||
            (user_status == "")
        )
        {
            self.promptUserToEnterStatus();
            return;
        }
        
        self.establishAtLocation("2",
            location_code_to_establish_at : "chicago",
            status_to_establish : user_status);
        
        // MUST Do something here to tell user you're establishing at location
    }
    
    func establishAtLocation(user_id : String, location_code_to_establish_at : String, status_to_establish : String)
    {
        var networkRequestModel = HereNetworkRequest();
        networkRequestModel.includeXdebugCookie(true);
        
        var paramDictionary = Dictionary<String, String>();
        paramDictionary[networkRequestModel.user_id_param] = user_id;
        paramDictionary[networkRequestModel.location_code_param] = location_code_to_establish_at;
        paramDictionary[networkRequestModel.status_param] = status_to_establish;
        
        var url_to_post_to = networkRequestModel.api_url + self.establish_at_location_uri;
        
        networkRequestModel.post(paramDictionary, url : url_to_post_to, callbackMethod: self.establishAtLocationHandler);
    }
    
    func establishAtLocationHandler(networkRequestResponseObject : NetworkRequestResult)
    {
        var wasRequestSuccess = networkRequestResponseObject.didRequestReturnSuccess();
        
        if (wasRequestSuccess)
        {
            var optional_users_at_location = networkRequestResponseObject.getResponseBodyValue(self.users_at_location_key);
         
            switch optional_users_at_location
            {
                case let usersAtLocationDictionary as Dictionary<String, String>:
                    let locationHereControllerInstance = self.storyboard!.instantiateViewControllerWithIdentifier("LocationHereController") as LocationHereController;
                    
                    locationHereControllerInstance.setNavControllerToPushOnto(self.navigationController!);
                    locationHereControllerInstance.processUsersAtLocationData(usersAtLocationDictionary);
                default:
                    self.establishAtLocationHandlerFailure();
            }
        }
        else
        {
            self.establishAtLocationHandlerFailure();
        }
    }
    
    // MUST do something here
    func establishAtLocationHandlerFailure()
    {
        
    }
    
    // MUST ensure that this is called when coming from location hereable list to this screen
    override func viewDidLoad()
    {
        self.resetStatusTextField();
        statusTextField.text = "Enter status here";
        statusTextField.textColor = UIColor.blackColor();
    }
    
    func resetStatusTextField()
    {
        self.status_has_been_updated = false;
        statusTextField.clearsOnBeginEditing = true;
        //statusTextField.clearsOnInsertion = true;
    }
    
    func promptUserToEnterStatus()
    {
        self.resetStatusTextField();
        statusTextField.textColor = UIColor.redColor();
        statusTextField.text = "Please Enter Status Here";
    }
    
    func transitionToLoginController()
    {
        let loginController = self.storyboard!.instantiateViewControllerWithIdentifier("LoginController") as LoginController;
        
        let navigationController = self.navigationController!;
        
        navigationController.pushViewController(loginController, animated: true);
    }
}