//
//  CustomTableViewCell.swift
//  Proy-Restaurante
//
//  Created by fredy asencios (AppsLovers) on 23/02/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tituloCell: UILabel!
    
    @IBOutlet weak var subtitleCell: UILabel!
    
    @IBOutlet weak var imagenCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
