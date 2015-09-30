//
//  WhitelistViewController.swift
//  Open AdBlock
//
//  Created by Saagar Jha on 8/18/15.
//  Copyright © 2015 OpenAdBlock. All rights reserved.
//

import UIKit

class WhitelistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifer = "whitelist"
    
    var whitelist: [String]!
    
    @IBOutlet weak var whitelistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        whitelist = AdBlocker.sharedInstance.whitelist
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setToolbarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        whitelist = AdBlocker.sharedInstance.whitelist
    }
    
    @IBAction func addWebsite(sender: AnyObject) {
        var websiteTextField: UITextField!
        let alertController = UIAlertController(title: "Whitelist website", message: "Enter the name of the website to block", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler({(textField: UITextField) in
            websiteTextField = textField
            websiteTextField.autocapitalizationType = .None
            websiteTextField.autocorrectionType = .No
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .Default, handler: {(_) in
//                AdBlocker.sharedInstance.addWhitelistedWebsite(websiteTextField.text!
//                self.whitelist = AdBlocker.sharedInstance.whitelist
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.whitelistTableView.reloadData()
//                })
//            )})
            AdBlocker.sharedInstance.addWhitelistedWebsite(websiteTextField.text!)
            self.whitelist = AdBlocker.sharedInstance.whitelist
            dispatch_async(dispatch_get_main_queue(), {
                self.whitelistTableView.reloadData()
            })
        })
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whitelist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer) as UITableViewCell!
        cell.textLabel?.text = whitelist[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        deleteRowsAtIndexPaths([indexPath])
    }
    
    func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath]) {
        for indexPath in indexPaths {
            let url = whitelist[indexPath.row]
            AdBlocker.sharedInstance.removeWhitelistedWebsite(url)
        }
        whitelist = AdBlocker.sharedInstance.whitelist
        whitelistTableView.beginUpdates()
        whitelistTableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Fade)
        whitelistTableView.endUpdates()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
