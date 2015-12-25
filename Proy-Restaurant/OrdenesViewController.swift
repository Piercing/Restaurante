//
//  OrdenesViewController.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 23/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

class OrdenesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablaOrdenes: UITableView!
    
    @IBOutlet weak var totalPedido: UILabel!
    
    
    var arrayOrdenes = []
    
    override func viewWillAppear(animated: Bool) {
        let objDAO = DataBase()
        arrayOrdenes = objDAO.ejecutarSelect("select * from ordenpedido")
        
        // llamamos al objeto miTableView y la actualizamos cada vez que solicitamos los datos
        // a la BBDD, con esto conseguimos actulizar la tabla por si hubiera nuevos registros.
        self.tablaOrdenes.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var totalSuma:Float = 0.0
        
        for item in arrayOrdenes{
            
            let precioP = Float(item["precio_plato"] as! String)
            let cantidadP = (item["cantidad_plato"] as! Int)
            let precioSemiTotal = precioP! * Float(cantidadP)
            totalSuma += precioSemiTotal
        }
        totalPedido.text = "\(totalSuma)€"
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
        
        let cell = self.tablaOrdenes.dequeueReusableCellWithIdentifier("cellOrden")! as! CellOrdenTableViewCell
        
        let nombrePlato =  arrayOrdenes[indexPath.row]["nombre_plato"] as! String
        let precioPlato = arrayOrdenes[indexPath.row]["precio_plato"] as! String
        let cantidad = arrayOrdenes[indexPath.row]["cantidad_plato"] as! String
        
        cell.cantidadCellOrder.text = cantidad
        cell.nombreCellOrder.text = nombrePlato
        // conversión
        let precioNum = Float(precioPlato)!
        let cantidadNum = Float(cantidad)!
        let precioSemitotal = Float(precioNum * cantidadNum)
        
        cell.precioCellOrder.text = "\(precioSemitotal)"

        return cell
    }
    
}
