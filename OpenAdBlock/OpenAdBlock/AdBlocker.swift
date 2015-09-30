//
//  AdBlocker.swift
//  Open AdBlock
//
//  Created by Saagar Jha on 8/21/15.
//  Copyright © 2015 OpenAdBlock. All rights reserved.
//

import Foundation
import SafariServices

class AdBlocker {
    static let sharedInstance = AdBlocker()
    
    var JSONData: [AnyObject]!
    
    var whitelist: [String]!
    
    var whitelistString: String {
        get {
            return whitelist.joinWithSeparator(", ")
        }
    }
    
    init() {
        copyFile()
        whitelist = []
        let data = NSData(contentsOfURL: NSURL(fileURLWithPath: ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as NSString).stringByAppendingPathComponent("DefaultList") as NSString).stringByAppendingPathExtension("json")!))
        var jsonData: AnyObject?
        do {
            jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
        } catch let error {
            assertionFailure("Error parsing JSON: \(error)")
        }
        JSONData = jsonData as! [AnyObject]
        //print(jsonData)
        for json in jsonData as! [AnyObject] {
            //print(json)
            if let trigger = (json as! [String: AnyObject])["trigger"] {
                //print(trigger)
                if let websites = (trigger as! [String: AnyObject])["unless-domain"] {
                    //print(websites)
                    if websites as! String != "" {
                        whitelist = (websites as! String).componentsSeparatedByString(", ")
                    }//whitelist.append(website as! String)
                    //print(website)
                }
            }
        }
    }
    
    func copyFile() {
        let bundlePath = ((NSBundle.mainBundle().resourcePath! as NSString).stringByAppendingPathComponent("DefaultList") as NSString).stringByAppendingPathExtension("json")!
        let documentsPath = ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as NSString).stringByAppendingPathComponent("blockerList") as NSString).stringByAppendingPathExtension("json")!
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(documentsPath) {
            do {
                try fileManager.copyItemAtPath(bundlePath, toPath: documentsPath)
            } catch let error {
                assertionFailure("Could not copy DefaultList: \(error)")
            }
        }
    }
    
    func reloadWhitelist() {
        var newData = [AnyObject]()
        for json in JSONData {
            //print(json)
            var json2: [String: AnyObject] = json as! [String : AnyObject]
            if let trigger = (json2)["trigger"] {
                //print(trigger)
                var trigger2: [String: AnyObject] = trigger as! [String : AnyObject]
                trigger2["unless-domain"] = whitelistString
                print(whitelistString)
                json2["trigger"] = trigger2
                //print(websites)
                //whitelist = (websites as! String).componentsSeparatedByString(", ")                    //whitelist.append(website as! String)
                //print(website)
                
            }
            newData.append(json2)
        }
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(newData, options: .PrettyPrinted)
            data.writeToFile(((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as NSString).stringByAppendingPathComponent("DefaultList") as NSString).stringByAppendingPathExtension("json")!, atomically: false)
            SFContentBlockerManager.reloadContentBlockerWithIdentifier("\(NSBundle.mainBundle().bundleIdentifier).OpenAdblockContentBlocker", completionHandler: {(error) in print(error)})
            //print(String(data: data, encoding: NSASCIIStringEncoding))
        } catch let error {
            assertionFailure("Could not modify the whitelist: \(error)")
        }
        JSONData = newData
    }
    
    func addWhitelistedWebsite(website: String) {
        whitelist.append(website)
        reloadWhitelist()
    }
    
    func removeWhitelistedWebsite(website: String) {
        whitelist.removeAtIndex(whitelist.indexOf(website)!)
        reloadWhitelist()
    }
}