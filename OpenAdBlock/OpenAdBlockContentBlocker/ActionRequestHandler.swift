//
//  ActionRequestHandler.swift
//  AdBlock Content Blocker
//
//  Created by Justin on 2015-08-13.
//  Copyright © 2015 OpenAdBlock. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {
    
    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        //if (NSUserDefaults(suiteName: "group.openadblock.openadblock")!.boolForKey("blockAds")) {
            let attachment = NSItemProvider(contentsOfURL: NSURL(fileURLWithPath: ((NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! as NSString).stringByAppendingPathComponent("DefaultList") as NSString).stringByAppendingPathExtension("json")!))!
            let item = NSExtensionItem()
            item.attachments = [attachment]
            
            context.completeRequestReturningItems([item], completionHandler: nil);
        //} else {
          //  context.completeRequestReturningItems(nil, completionHandler: nil)
        //}
    }
    
}
