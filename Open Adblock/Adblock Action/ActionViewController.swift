//
//  ActionViewController.swift
//  Adblock Action
//
//  Created by Saagar Jha on 8/31/15.
//  Copyright © 2015 OpenAdblock. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "whitelistedWebsite"
    
    @IBOutlet weak var whitelistedWebsitesTableView: UITableView!

    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Get the item[s] we're handling from the extension context.
        
        for item: AnyObject in self.extensionContext!.inputItems {
            let inputItem = item as! NSExtensionItem
            for provider: AnyObject in inputItem.attachments! {
                let itemProvider = provider as! NSItemProvider
                if itemProvider.hasItemConformingToTypeIdentifier(kUTTypeURL as String) {
                    itemProvider.loadItemForTypeIdentifier(kUTTypeURL as String, options: nil, completionHandler: { (urlCoding, error) in
                        let urlString = "\(urlCoding!)"
                        self.url = (NSURL(string: urlString)?.host) ?? ""
                        
                        //self.label.text = "\(URL)"
                    })
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = whitelistedWebsitesTableView.cellForRowAtIndexPath(indexPath)!
        cell.textLabel?.text = url
        return cell
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequestReturningItems(self.extensionContext!.inputItems, completionHandler: nil)
    }

}
