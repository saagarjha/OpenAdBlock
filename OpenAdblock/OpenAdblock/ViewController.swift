//
//  ViewController.swift
//  OpenAdBlock
//
//  Created by Saagar Jha on 10/10/16.
//  Copyright © 2016 Saagar Jha. All rights reserved.
//

import SafariServices
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	let cellIdentifier = "cell"
	
	@IBOutlet var tableView: UITableView!
	let `switch` = UISwitch()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		`switch`.addTarget(self, action: #selector(ViewController.valueChanged), for: .valueChanged)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func valueChanged(sender: UISwitch) {
		print(sender.isOn)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return "In theory, the content blocker should have turned on by itself. If it's not working, please turn it on in Settings > Safari > Content Blockers. The switch above doesn't do anything yet."
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		cell.textLabel?.text = "Enabled"
		cell.accessoryView = `switch`
		return cell
	}
	
}
