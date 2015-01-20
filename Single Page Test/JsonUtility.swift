//
//  JsonUtility.swift
//  Single Page Test
//
//  Created by Sean Dunagan on 1/4/15.
//  Copyright (c) 2015 Dunagan Enterprises LLC. All rights reserved.
//

import Foundation

class JsonUtility
{
     class func JSONParseArray(jsonString: String) -> [AnyObject] {
        
        var jsonStringWithBrackets = "[" + jsonString + "]";
        
        if let data = jsonStringWithBrackets.dataUsingEncoding(NSUTF8StringEncoding) {
            if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
                return array
            }
        }
        return [AnyObject]()
    }
    
    class func parseJSONStringAsDictionary(json_string: String, json_keys_to_grab : Array<String>) -> Dictionary<String,String>
    {
        var jsonAnyObjectArray = JsonUtility.JSONParseArray(json_string);
        
        var jsonAsDictionaryToReturn = Dictionary<String, String>();
        
        for jsonAnyObject: AnyObject in jsonAnyObjectArray
        {
            for key in json_keys_to_grab
            {
                println(key);
                switch jsonAnyObject[key]
                {
                    case let json_value as String:
                        jsonAsDictionaryToReturn.updateValue(json_value as String, forKey: key);
                    default:
                        jsonAsDictionaryToReturn.updateValue("", forKey: key);
                }
            }
        }
        
        return jsonAsDictionaryToReturn;
    }
}
