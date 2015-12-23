//
//  CellOrderTableViewCell.swift
//  Proy-Restaurante
//
//  Created by Fredy Asencios on 4/5/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit

class CellOrderTableViewCell: UITableViewCell {

    
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
