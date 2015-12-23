//
//  DetalleViewController.swift
//  Proy-Restaurante
//
//  Created by fredy asencios (AppsLovers) on 23/02/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit
import Social

class DetalleViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var imagenDetalle: UIImageView!
    
    @IBOutlet weak var tituloDetalle: UILabel!
    
    @IBOutlet weak var precioDetalle: UILabel!
    
    @IBOutlet weak var descripcionDetalle: UITextView!
    
    var nombreArchivo = ""
    var precioPlato = ""
    var datoDetalle:NSDictionary!
    
    @IBOutlet weak var cantidaOrden: UITextField!
    
    
    @IBAction func agregarOrden(sender: AnyObject) {
        
        var objDAO  =  DataBase()
        var cantidadOrden = cantidaOrden.text as NSString
        var nomPlato = tituloDetalle.text!
        var prePlato = precioPlato
        var arcPlato = nombreArchivo
        var sqlinsert = "insert into ordenpedido(nombre_plato, precio_plato, archivo_plato, cantidad_plato) values ('\(nomPlato)','\(prePlato)','\(arcPlato)','\(cantidadOrden)')"
        
        objDAO.ejecutarInsert(sqlinsert)
       
        var ruta = DataBase.getDataBasePath()
        devolverPosicionInicial()
        alertaOrden()
        //println(ruta)
        
    }
    override func viewDidLoad() {
        cantidaOrden.delegate = self 
       
        super.viewDidLoad()

        //imagen
        nombreArchivo = datoDetalle["archivo_plato"] as NSString
        imagenDetalle.image = UIImage(named: nombreArchivo)
        //nombre y precio
        var nombrePlato = datoDetalle["nombre_plato"] as NSString
        precioPlato = datoDetalle["precio_plato"] as NSString
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
    

    @IBAction func shareButton(sender: AnyObject) {
        
        var textoCompartir = ""
        if let nombrePlato = tituloDetalle.text{
        textoCompartir = "Recomendamos visitar nuestro RESTAURANTE y disfrutar de este exquisito plato: \(nombrePlato)"
        
        }
        let imagenShare:UIImage! = imagenDetalle.image
        
        if let urlCompartir = NSURL(string: "http://www.google.com"){
        
        
            var objetoCompartir:NSArray = [textoCompartir,imagenShare,urlCompartir]
            
            var socialActivity = UIActivityViewController(activityItems: objetoCompartir, applicationActivities: nil)
            
            self.presentViewController(socialActivity, animated: true, completion: nil)
            
        }
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    //func delegados de textField
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-200, self.view.frame.width, self.view.frame.height)
        })
        return true
    }

    //alertView
    func alertaOrden(){
        var mensaje = ""
        var textoCantidad:NSString = cantidaOrden.text
        if textoCantidad.length != 0 {
            mensaje = "esta agregando \(cantidaOrden.text) de \(tituloDetalle.text!) a su pedido"
        
        }else{
            mensaje = "debe agregar una cantidad a su orden"
        
        }
        
        var alertOrden  = UIAlertController(title: "Orden de Pedido", message: mensaje, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .Default , handler: nil)
        alertOrden.addAction(defaultAction)
        presentViewController(alertOrden, animated: true, completion: nil)
    
    
    }
    
    func devolverPosicionInicial(){
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        })
    
    }
}
