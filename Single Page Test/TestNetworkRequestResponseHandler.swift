//
//  testNetworkResponseHandler.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/29/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation

class TestNetworkRequestResponseHandler
{
    func handleNetworkRequestResponse(networkRequestResponseObject : NetworkRequestResult)
    {
        var networkRequestResponseData : NSDictionary? = networkRequestResponseObject.getRequestResponseBody();
        
        if let networkRequestResponseDataAsDictionary = networkRequestResponseData {
            println("Network Request Succeeded");
            println(networkRequestResponseDataAsDictionary);
        }
        else
        {
            println("An error occurred");
        }
    }
}
