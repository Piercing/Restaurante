//
//  DetalleViewController.swift
//  Proy-Restaurante
//
//  Created by fredy asencios (AppsLovers) on 23/02/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    
    @IBOutlet weak var imagenDetalle: UIImageView!
    
    @IBOutlet weak var tituloDetalle: UILabel!
    
    @IBOutlet weak var precioDetalle: UILabel!
    
    @IBOutlet weak var descripcionDetalle: UITextView!
    
    
    var datoDetalle:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //imagen
        var nombreArchivo = datoDetalle["archivo_plato"] as NSString
        imagenDetalle.image = UIImage(named: nombreArchivo)
        //nombre y precio
        var nombrePlato = datoDetalle["nombre_plato"] as NSString
        var precioPlato = datoDetalle["precio_plato"] as NSString
        var descripPlato = datoDetalle["descripcion_plato"] as NSString
        
        tituloDetalle.text = nombrePlato
        precioDetalle.text = "Precio S/. \(precioPlato)"
        descripcionDetalle.text = descripPlato
        
        
        //println("dato: \(datoDetalle)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
