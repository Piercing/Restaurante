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
        
        
        //definir objetos dictionary para plato
        let plato_ensalada = ["Knombre":"Ensalada de Verduras","Kdescripcion":"Verduras picadas con tomate, zanahoria y lechuga","Kprecio":"14.50","Kimagen":"ensalada.jpg"]
        
        let Sopa = ["Knombre":"Sopa de Pollo","Kdescripcion":"Pollo hervido con verduras y papas con fideos","Kprecio":"10.45","Kimagen":"sopa.jpg"]
        
        let frejol = ["Knombre":"Frejoles","Kdescripcion":"Guiso de frejoles con arroz y pescado frito","Kprecio":"18.4","Kimagen":"frejoles.jpg"]
        
        let postre = ["Knombre":"Gelatina de fresa","Kdescripcion":"Gelatina de fresa con leche","Kprecio":"3.3","Kimagen":"gelatina.jpg"]
        
        arrayPlatos = [plato_ensalada,Sopa,frejol,postre,plato_ensalada,Sopa,frejol,postre,plato_ensalada,Sopa,frejol,postre,plato_ensalada,Sopa,frejol,postre,plato_ensalada,Sopa,frejol,postre]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let nombrePlato = arrayPlatos[indexPath.row]["Knombre"] as! String
        let precioPlato = arrayPlatos[indexPath.row]["Kprecio"] as! String
        let imagenPlato = arrayPlatos[indexPath.row]["Kimagen"] as! String
        //cell.textLabel?.text = nombrePlato as? String
        cell.tituloCell.text = nombrePlato 
        cell.subtitleCell.text = "Precio S/. \(precioPlato)€"
        cell.imageCell.image = UIImage(named: imagenPlato)
        
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
}












