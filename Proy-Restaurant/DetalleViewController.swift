//
//  DetalleViewController.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 16/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {
    
    
    @IBOutlet weak var imagenDetalle: UIImageView!
    
    @IBOutlet weak var tituloDetalle: UILabel!
    
    @IBOutlet weak var precioDetalle: UILabel!
    
    @IBOutlet weak var descripcionDetalle: UITextView!
    
    var datoDetalle : NSDictionary = NSDictionary()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imagen plato
        if let nombreArchivo = datoDetalle["archivo_plato"] as? String{
            imagenDetalle.image = UIImage(named: nombreArchivo)
        }
        // Nombre, precio y detalle plato
        if let nombrePlato: String = datoDetalle["nombre_plato"] as? String{
            tituloDetalle.text = nombrePlato
        }
        if let precioPlato = datoDetalle["precio_plato"] as? String{
            precioDetalle.text = "Precio S/.\(precioPlato)€"
        }
        if let descripPlato = datoDetalle["descripcion_plato"]as? String{
            descripcionDetalle.text = descripPlato
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareButton(sender: AnyObject) {
        
        var textoCompartir = ""
        if let nombrePlato = tituloDetalle.text{ textoCompartir = "Recomendamos visitar nuestro RESTAURANTE y disfurtar de este exquisito plato: \(nombrePlato)"
        }
        
        let imagenShared:UIImage! = imagenDetalle.image
        
        if let urlCompartir = NSURL(string: "http://www.google.es"){
            
            let objetoCompartir:NSArray = [textoCompartir, imagenShared, urlCompartir]
            
            let socialActivity = UIActivityViewController(activityItems: objetoCompartir as [AnyObject], applicationActivities: nil)
            
            self.presentViewController(socialActivity, animated: true, completion: nil)
        }
        
        
    }
    
    
    
    
    
    
    
}
