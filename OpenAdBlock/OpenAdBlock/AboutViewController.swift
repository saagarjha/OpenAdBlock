//
//  AboutViewController.swift
//  Open AdBlock
//
//  Created by Saagar Jha on 9/21/15.
//  Copyright © 2015 OpenAdblock. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.scrollEnabled = true
        }
    }
    
    @IBOutlet weak var aboutView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.image = UIImage(named: ((NSBundle.mainBundle().infoDictionary?["CFBundleIcons"]?["CFBundlePrimaryIcon"] as? NSDictionary)!["CFBundleIconFiles"] as! NSArray).lastObject as! String)
        }
    }
    
    @IBOutlet weak var aboutTextView: UITextView! {
        didSet {
            aboutTextView.editable = false
            aboutTextView.scrollEnabled = false
            aboutTextView.textContainer.lineFragmentPadding = 0
            aboutTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
            aboutTextView.userInteractionEnabled = true
            aboutTextView.text = "TODO About, Github link"
        }
    }
    
    
    @IBOutlet weak var licenseTextView: UITextView! {
        didSet{
            licenseTextView.editable = false
            licenseTextView.scrollEnabled = false
            licenseTextView.textContainer.lineFragmentPadding = 0
            licenseTextView.userInteractionEnabled = true
            licenseTextView.text = "TODO Contributors and License test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test"
//            licenseLabel.lineBreakMode = .ByWordWrapping
//            licenseLabel.numberOfLines = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.bounds = view.bounds
//        licenseTextView.preferredMaxLayoutWidth = view.bounds.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return true
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
