//
//  SettingsTableViewController.swift
//  Open AdBlock
//
//  Created by Justin on 2015-08-13.
//  Copyright © 2015 OpenAdBlock. All rights reserved.
//

import SafariServices
import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    @IBOutlet weak var blockAds: UISwitch! {
//        didSet {
//            blockAds.setOn(NSUserDefaults(suiteName: "group.openadblock.openadblock")?.boolForKey("blockAds") ?? false, animated: false)
//        }
//    }
//    @IBOutlet weak var blockAnalytics: UISwitch!
//    
//    let testAdBlockWebView = UIWebView()
    
    let whitelistCellIdentifer = "whitelist"
    let helpCellIdentifier = "help"
    let aboutCellIdentifier = "about"
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        testAdBlockWebView.scalesPageToFit = true
//        testAdBlockWebView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.jusleg.com/testOAB")!))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell!
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier(whitelistCellIdentifer)!
            cell.textLabel?.text = "Whitelist"
        } else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier(helpCellIdentifier)!
            cell.textLabel?.text = "Help"
        } else if indexPath.row == 2 {
            cell = tableView.dequeueReusableCellWithIdentifier(aboutCellIdentifier)!
            cell.textLabel?.text = "About"
        } else {
            cell = nil
            assertionFailure("Invalid row")
        }
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
//    @IBAction func blockAds(sender: AnyObject) {
//        NSUserDefaults(suiteName: "group.openadblock.openadblock")!.setBool((sender as! UISwitch).on, forKey: "blockAds")
//        SFContentBlockerManager.reloadContentBlockerWithIdentifier("\(NSBundle.mainBundle().bundleIdentifier!).contentblockerextension", completionHandler: nil)
//    }
//    
//    @IBAction func blockAnalytics(sender: AnyObject) {
//    }
//   
//    @IBAction func openSettings(sender: AnyObject) {
//        if let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString) {
//            UIApplication.sharedApplication().openURL(settingsURL)
//        }
//    }
//    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 1 {
//            return testAdBlockWebView
//        } else {
//            return super.tableView(tableView, viewForFooterInSection: section)
//        }
//    }
//    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if section == 1 {
//            return CGFloat(200)
//        } else {
//            return super.tableView(tableView, heightForFooterInSection: section)
//        }
//    }
}