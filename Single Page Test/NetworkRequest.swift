//
//  PostRequest.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 12/29/14.
//  Copyright (c) 2014 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation

class NetworkRequest
{
    var post_request_response : String;
    var include_xdebug_cookie : Bool;
    
    init()
    {
        self.post_request_response = "";
        self.include_xdebug_cookie = false;
    }
    
    func includeXdebugCookie(flag : Bool)
    {
        self.include_xdebug_cookie = flag;
    }
    
    func getPostResponse() -> String{
        return self.post_request_response;
    }
    
    func includeXdebugCookieOnRequest(request : NSMutableURLRequest) -> Void
    {
        request.addValue("XDEBUG_SESSION=PHPSTORM", forHTTPHeaderField: "Cookie")
    }
    
    func post(params : Dictionary<String, String>, url : String, callbackMethod : (NetworkRequestResult) -> Void) -> Void
    {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var err: NSError?
        var httpBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        
        request.HTTPBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if (self.include_xdebug_cookie)
        {
            self.includeXdebugCookieOnRequest(request);
        }
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            var err: NSError?
            var responseJsonObject = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            var NetworkRequestResponseObject = NetworkRequestResult()
            NetworkRequestResponseObject.setRequestResponseData(response, RequestResponseBodyObject: responseJsonObject)
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = responseJsonObject {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                }
            }
            
            callbackMethod(NetworkRequestResponseObject);
        })
        
        task.resume()
    }
}

class NetworkRequestResult
{
    var RequestResponseHeaders : NSURLResponse?;
    var RequestResponseBody : NSDictionary?;
    var request_response_body_is_dictionary = false;
    
    init()
    {
        self.RequestResponseHeaders = nil;
        self.RequestResponseBody = nil;
        self.request_response_body_is_dictionary = false;
    }
    
    func didRequestReturnSuccess() -> Bool
    {
        var optional_success_flag = self.getResponseBodyValue("success");
        
        if let success_flag = optional_success_flag
        {
            switch success_flag
            {
                case 1 as Int:
                    return true;
                case 0 as Int:
                    return false;
                default:
                    return false;
            }
        }
        
        return false;
    }
    
    func getResponseBodyValue(key : String) -> AnyObject?
    {
        if self.request_response_body_is_dictionary
        {
            var definiteRequestResponseBody = self.RequestResponseBody!;
            return definiteRequestResponseBody.objectForKey(key);
        }
        
        return nil;
    }
    
    func setRequestResponseData(RequestResponseObject : NSURLResponse?, RequestResponseBodyObject : NSDictionary?)
    {
        self.RequestResponseHeaders = RequestResponseObject;
        self.RequestResponseBody = RequestResponseBodyObject;
        
        if let requestResponseBodyObject = self.RequestResponseBody
        {
            self.request_response_body_is_dictionary = true;
        }
        else
        {
            self.request_response_body_is_dictionary = false;
        }
    }
    
    func getRequestResponseHeaders() -> NSURLResponse?
    {
        return self.RequestResponseHeaders;
    }
    
    func getRequestResponseBody() -> NSDictionary?
    {
        return self.RequestResponseBody;
    }
}


