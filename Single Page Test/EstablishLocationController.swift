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
    
    @IBAction func executeSignOut(sender: UIButton, forEvent event: UIEvent)
    {
        self.transitionToLoginController();
    }
    
    @IBAction func executeEstablishLocation(sender: UIButton, forEvent event: UIEvent)
    {
        self.establishAtLocation("1",
            location_code_to_establish_at : "chicago",
            status_to_establish : "Testing status for user with id 1");
        
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
    
    func transitionToLoginController()
    {
        let loginController = self.storyboard!.instantiateViewControllerWithIdentifier("LoginController") as LoginController;
        
        let navigationController = self.navigationController!;
        
        navigationController.pushViewController(loginController, animated: true);
    }
}