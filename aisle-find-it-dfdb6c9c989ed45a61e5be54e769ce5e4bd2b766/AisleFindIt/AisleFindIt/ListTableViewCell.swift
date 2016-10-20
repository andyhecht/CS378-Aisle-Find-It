//
//  ListTableViewCell.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/20/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var item: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        item.placeholder = "Enter Item"
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
