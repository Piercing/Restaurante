//
//  SecondViewController.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 16/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var miTableView: UITableView!
    
    var arrayPlatos = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        //print("Datos: \(arrayPlatos)")
        print("View Did load")
    }
    
    // Ciclo de vida de la View
    override func viewWillAppear(animated: Bool) {
        print("will apper")
        
        
        
        // Instanciar y definir un objeto DAO
        let objDAO = DataBase()
        // leemos lo que contine la BBDD y lo almacenamos en el array
        arrayPlatos = objDAO.ejecutarSelect("select * from platos_comidas")
        
        // llamamos al objeto miTableView y la actualizamos cada vez que solicitamos los datos
        // a la BBDD, con esto conseguimos actulizar la tabla por si hubiera nuevos registros.

        self.miTableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        print("Did appear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("Did Disappear")
    }
    
    
    
    
    
    // Estos son los tres métodos delegados que hay que implementar
    // cuando arrastramos con control desde la tableView hacia el View
    // Controller y seleccionamos 'DataSource' y 'delegate'. Para ello
    // extendemos primeros la clase a que implemente dichos protocolos.
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPlatos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.miTableView.dequeueReusableCellWithIdentifier("Cell")! as! CustomTableViewCell
        
        if let nombrePlato = arrayPlatos[indexPath.row]["nombre_plato"] as? String{
            cell.tituloCell.text = nombrePlato
        }
        if let precioPlato = arrayPlatos[indexPath.row]["precio_plato"] as? String{
            cell.subtitleCell.text = "Precio S/. \(precioPlato)€"
        }
        if let imagenPlato = arrayPlatos[indexPath.row]["archivo_plato"] as? String{
            cell.imageCell.image = UIImage(named: imagenPlato)
        }
        
        
        return cell
    }
    
    // Creamos el 'passigData' para pasar datos de una vista a otra
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // guardamos en una variable la fila seleccionada en 'miTableView'
        if let indePath = self.miTableView.indexPathForSelectedRow{
            
            // averiguar el objeto seleccionado
            let objSelected = arrayPlatos[indePath.row] as! NSDictionary
            
            // necesitamos condicionar el objeto destino,
            // que es la vista destino (DetalleViewController).
            if let objVistaDestino = segue.destinationViewController as? DetalleViewController{
                
                // accedemos a la variable creada en 'DetalleViewController'
                // mediante el segue que acabamos de crear y le pasamos el
                // objeto, fila-row, seleccionada.
                objVistaDestino.datoDetalle = objSelected
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}












