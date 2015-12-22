//
//  SecondViewController.swift
//  Proy-Restaurante
//
//  Created by fredy asencios (AppsLovers) on 22/02/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrayPlatos = []
    
    var refreshControl = UIRefreshControl()
    
    @IBOutlet weak var miTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imagen para el nav bar
        
        var imgBackground = UIImage(named: "toolbarFondo.png")
        self.navigationController?.navigationBar.setBackgroundImage(imgBackground, forBarMetrics: .Default)
        
        self.miTableView.addSubview(refreshControl)
        self.refreshControl.addTarget(self, action: "didRefreshList", forControlEvents: .ValueChanged)
        //definir objetos dictionary para plato
        /*
        let plato_ensalada = ["Knombre":"Ensalada de Verduras","Kdescripcion":"Verdurasl picadas con tomate, zanahoria y lechuga","Kprecio":"14.50","Kimagen":"ensalada.jpg"]
        
        let Sopa = ["Knombre":"Sopa de Pollo","Kdescripcion":"Pollo hervido con verduras y papas con fideos","Kprecio":"10.45","Kimagen":"sopa.jpg"]
        
        let frejol = ["Knombre":"Frejoles","Kdescripcion":"Guiso de frejoles con arroz y pescado frito","Kprecio":"18.4","Kimagen":"frejoles.jpg"]
        
        let postre = ["Knombre":"Gelatina de fresa","Kdescripcion":"Gelatina de fresa con leche","Kprecio":"3.3","Kimagen":"gelatina.jpg"]
        
        arrayPlatos = [plato_ensalada,Sopa,frejol,postre,plato_ensalada,Sopa,frejol,postre,plato_ensalada,Sopa,frejol,postre]
        */
        
        //iniciar la BD
       
        
        //instanciar y definir un objeto DAO
        
        // println(arrayPlatos)
        
        println("View Did load")
    }
    func didRefreshList(){
        println("inicia")
        var objDelegate = AppDelegate()
        objDelegate.parsearySincronizar()
       
        self.miTableView.reloadData()

        self.refreshControl.endRefreshing()
        println("termina")
    }
     override func viewWillAppear(animated: Bool) {
        println("will appear")
        
        
        var objDAO = DataBase()
        
        arrayPlatos = objDAO.ejecutarSelect("select * from platos_comidas ")
        
        self.miTableView.reloadData()
        
    }
    override func viewDidAppear(animated: Bool) {
        println(" did appear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println(" Did Disappear")
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPlatos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.miTableView.dequeueReusableCellWithIdentifier("Cell") as CustomTableViewCell
        
        
        var nombrePlato = arrayPlatos[indexPath.row]["nombre_plato"]
        var precioPlato = arrayPlatos[indexPath.row]["precio_plato"] as NSString
        
        var imagenPlato = arrayPlatos[indexPath.row]["archivo_plato"] as NSString
        //cell.textLabel!.text  = nombrePlato as NSString
        cell.tituloCell.text = nombrePlato as NSString
        cell.subtitleCell.text = "Precio S/. \(precioPlato)"
        cell.imagenCell.image = UIImage(named: imagenPlato)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let indexPath = self.miTableView.indexPathForSelectedRow(){
        
            let objSelected = arrayPlatos[indexPath.row] as NSDictionary
            
            if let objVistaDestino = segue.destinationViewController as? DetalleViewController {
                
                objVistaDestino.datoDetalle = objSelected
            
            }
            
        }
        
        
    }

}

