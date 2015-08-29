//
//  ActionRequestHandler.swift
//  Adblock Content Blocker
//
//  Created by Justin on 2015-08-13.
//  Copyright © 2015 OpenAdblock. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {
    
    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        //if (NSUserDefaults(suiteName: "group.openadblock.openadblock")!.boolForKey("blockAds")) {
            let attachment = NSItemProvider(contentsOfURL: NSBundle.mainBundle().URLForResource("blockerList", withExtension: "json"))!
            let item = NSExtensionItem()
            item.attachments = [attachment]
            
            context.completeRequestReturningItems([item], completionHandler: nil);
        //} else {
          //  context.completeRequestReturningItems(nil, completionHandler: nil)
        //}
    }
    
}
