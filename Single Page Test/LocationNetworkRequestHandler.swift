//
//  LocationNetworkRequest.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 1/2/15.
//  Copyright (c) 2015 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation
import UIKit
/*

CLASS NO LONGER IN USE


class LocationNetworkRequestHandler : NetworkRequestHandler
{
    let establish_at_location_uri = "here/establish";
    let users_at_location_key = "users_at_location_data";
    
    func establishAtLocationHandler(networkRequestResponseObject : NetworkRequestResult)
    {
        var wasRequestSuccess = networkRequestResponseObject.didRequestReturnSuccess();
        
        if (wasRequestSuccess)
        {
            var optional_users_at_location = networkRequestResponseObject.getResponseBodyValue(self.users_at_location_key);
            
            switch optional_users_at_location
            {
                case let usersAtLocationDictionary as Dictionary<String, String>:
                    self.processUsersAtLocationData(usersAtLocationDictionary);
                default:
                    // TODO Handle Failure
                    self.establishAtLocationHandlerFailure();
            }
        }
        else
        {
            // TODO Handle failure
            self.establishAtLocationHandlerFailure();
        }
    }
    
    func establishAtLocationHandlerFailure()
    {
        
    }

    func processUsersAtLocationData(usersAtLocationDictionary : Dictionary<String, String>)
    {
        // MUST ensure we're using a singleton instance, not creating a new instance every time
    }
}
*/
