//
//  SettingsTableViewController.swift
//  Open Adblock
//
//  Created by Justin on 2015-08-13.
//  Copyright © 2015 OpenAdblock. All rights reserved.
//

import SafariServices
import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var blockAds: UISwitch! {
        didSet {
            blockAds.setOn(NSUserDefaults(suiteName: "group.openadblock.openadblock")?.boolForKey("blockAds") ?? false, animated: false)
        }
    }
    @IBOutlet weak var blockAnalytics: UISwitch!
    
    let testAdblockWebView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        testAdblockWebView.scalesPageToFit = true
        testAdblockWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.jusleg.com/testOAB")!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func blockAds(sender: AnyObject) {
        NSUserDefaults(suiteName: "group.openadblock.openadblock")!.setBool((sender as! UISwitch).on, forKey: "blockAds")
        SFContentBlockerManager.reloadContentBlockerWithIdentifier("\(NSBundle.mainBundle().bundleIdentifier!).openadblockextension", completionHandler: nil)
    }
    
    @IBAction func blockAnalytics(sender: AnyObject) {
    }
   
    @IBAction func openSettings(sender: AnyObject) {
        if let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(settingsURL)
        }
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1 {
            return testAdblockWebView
        } else {
            return super.tableView(tableView, viewForFooterInSection: section)
        }
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return CGFloat(200)
        } else {
            return super.tableView(tableView, heightForFooterInSection: section)
        }
    }
}