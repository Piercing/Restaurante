//
//  CellOrdenTableViewCell.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 23/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

class CellOrdenTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cantidadCellOrder: UILabel!
    
    @IBOutlet weak var nombreCellOrder: UILabel!
    
    @IBOutlet weak var precioCellOrder: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
