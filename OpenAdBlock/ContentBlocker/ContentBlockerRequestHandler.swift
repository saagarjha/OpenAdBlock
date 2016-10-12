//
//  ContentBlockerRequestHandler.swift
//  ContentBlocker
//
//  Created by Saagar Jha on 7/22/16.
//  Copyright © 2016 Saagar Jha. All rights reserved.
//

import UIKit
import MobileCoreServices

class ContentBlockerRequestHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
		let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: "blockerList", withExtension: "json"))!
        
        let item = NSExtensionItem()
        item.attachments = [attachment]
        
        context.completeRequest(returningItems: [item], completionHandler: nil);
    }
    
}
