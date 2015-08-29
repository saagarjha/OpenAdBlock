//
//  RuleTableViewCell.swift
//  Open Adblock
//
//  Created by Saagar Jha on 8/24/15.
//  Copyright © 2015 OpenAdblock. All rights reserved.
//

import UIKit

class RuleTableViewCell: UITableViewCell {
    
    var `switch`: UISwitch!
    
    var on: Bool {
        get {
            return `switch`.on
        }
        set {
            `switch`.on = newValue
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        `switch` = UISwitch()
        on = true
        `switch`.on = true
        accessoryView = `switch`
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
