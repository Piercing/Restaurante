//
//  OrdenesViewController.swift
//  Proy-Restaurante
//
//  Created by Fredy Asencios on 4/5/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit

class OrdenesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tablaOrders: UITableView!
    
    @IBOutlet weak var total2: UILabel!
    var arrayOrdenes = []
    
    
    override func viewWillAppear(animated: Bool) {
        var objDAO = DataBase()
        arrayOrdenes = objDAO.ejecutarSelect("select * from ordenpedido")
    }
    override func viewDidAppear(animated: Bool) {
        
        var totalSuma:Float = 0.0
        
        for object in arrayOrdenes{
        
            var precioP = (object["precio_plato"] as NSString).floatValue
            var cantidadP = (object["cantidad_plato"] as NSString).floatValue
            var precioSemitotal = precioP * cantidadP
            totalSuma = totalSuma + precioSemitotal
            
            
        }
        total2.text = "\(totalSuma)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOrdenes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.tablaOrders.dequeueReusableCellWithIdentifier("CellOrden") as CellOrderTableViewCell
        
        var nombrePlato = arrayOrdenes[indexPath.row]["nombre_plato"] as NSString
        var precioPlato = arrayOrdenes[indexPath.row]["precio_plato"] as NSString
        var cantidad = arrayOrdenes[indexPath.row]["cantidad_plato"] as NSString
        
        
        cell.cantidadCellOrder.text = cantidad
        cell.nombreCellOrder.text = nombrePlato
        
        var precioNum = precioPlato.floatValue
        var cantidadNum = cantidad.floatValue
        var precioSemitotal = precioNum * cantidadNum
        
        cell.precioCellOrder.text  = "\(precioSemitotal)"
        
        return cell
    }
    
}
