//
//  Adblocker.swift
//  Open Adblock
//
//  Created by Saagar Jha on 8/21/15.
//  Copyright © 2015 OpenAdblock. All rights reserved.
//

import Foundation

class Adblocker {
    static let sharedInstance = Adblocker()
    
    var ruleNames = [String]()
    
    init() {
        let data = NSData(contentsOfURL: NSURL(fileURLWithPath: ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as NSString).stringByAppendingPathComponent("blockerList") as NSString).stringByAppendingPathExtension("json")!))
        var jsonData: AnyObject?
        do {
           jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
        } catch _ {
            assertionFailure("Error parsing JSON")
        }
        //print(jsonData)
        for json in jsonData as! [AnyObject] {
            if let trigger = (json as! [String: AnyObject])["trigger"] {
                if let rule = (trigger as! [String: AnyObject])["url-filter"] {
                    ruleNames.append(rule as! String)
                    //print(website)
                }
            }
        }
    }
}