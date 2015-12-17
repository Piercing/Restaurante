//
//  CustomTableViewCell.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 16/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloCell: UILabel!
    @IBOutlet weak var subtitleCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
