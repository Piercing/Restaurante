//
//  DetalleViewController.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 16/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

// Utilizamos el método delegado para el 'texField' que ocultará el
// teclado del dispositivo al introducir una cantidad en la orden.
class DetalleViewController: UIViewController, UITextFieldDelegate {
    
    var datoDetalle : NSDictionary = NSDictionary()
    var nombreArchivo = ""
    var precioPlato = ""
    
    @IBOutlet weak var imagenDetalle: UIImageView!
    
    @IBOutlet weak var tituloDetalle: UILabel!
    
    @IBOutlet weak var precioDetalle: UILabel!
    
    @IBOutlet weak var descripcionDetalle: UITextView!
    
    @IBOutlet weak var cantidadOrden: UITextField!
    
    @IBAction func agregarOrden(sender: AnyObject) {
        
        let objDAO = DataBase()
        let cantidadOrden = self.cantidadOrden.text! as NSString
        let nomPlato = tituloDetalle.text!
        let precioPlato = self.precioPlato
        let archivoPlato = nombreArchivo
        
        if cantidadOrden == ""{
            let alerOrden = UIAlertController(title: "Atención", message: "Introduzca una cantidad no nula para ordenar", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alerOrden.addAction(defaultAction)
            presentViewController(alerOrden, animated: true, completion: nil)
            //exit(0)
        }else{
            let sqlInsert = "insert into ordenpedido (nombre_plato, precio_plato, archivo_plato, cantidad_plato) values('\(nomPlato)','\(precioPlato)','\(archivoPlato)','\(cantidadOrden)')"
            // llamamos al método insert con el objeto DAO
            objDAO.ejecutarInsert(sqlInsert)
        }
        
        
        
        // llamamos a la función 'getDataBasePath' para ver si se han guardado los datos y dónde
        let  ruta = DataBase.getDataBasePath()
        print(ruta) //nos devuelve la ruta donde se han guardado los datos en nuestro FileSystem
        // llamamos a la función devolverPosicionIncial antes de llamar a la funcicón 'alertaOrden'
        devolverPosicionInicial()
        // llamamos a la función orden cada vez que se produzca una orden al llegar aquí
        alertaOrden()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // le decimos que todos los métodos delegados que han sido aceptados por
        // la clase también sean aceptados por el campo textField 'cantidadOrden'
        cantidadOrden.delegate = self
        
        
        // imagen plato
        nombreArchivo = (datoDetalle["archivo_plato"] as! String)
        imagenDetalle.image = UIImage(named: nombreArchivo)
        
        // Nombre, precio y detalle plato
        if let nombrePlato: String = datoDetalle["nombre_plato"] as? String{
            tituloDetalle.text = nombrePlato
        }
        precioPlato = datoDetalle["precio_plato"] as! String
        precioDetalle.text = "Precio S/.\(precioPlato)€"
        
        if let descripPlato = datoDetalle["descripcion_plato"]as? String{
            descripcionDetalle.text = descripPlato
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Configurando botón de compartir
    @IBAction func shareButton(sender: AnyObject) {
        
        var textoCompartir = ""
        if let nombrePlato = tituloDetalle.text{
            textoCompartir = "Recomendamos visitar nuestro RESTAURANTE y disfurtar de este exquisito plato: \(nombrePlato)"
        }
        
        let imagenShared:UIImage! = imagenDetalle.image
        
        if let urlCompartir = NSURL(string: "http://www.google.es"){
            
            let objetoCompartir:NSArray = [textoCompartir, imagenShared, urlCompartir]
            
            let socialActivity = UIActivityViewController(activityItems: objetoCompartir as [AnyObject], applicationActivities: nil)
            
            self.presentViewController(socialActivity, animated: true, completion: nil)
        }
    }
    
    // Oculatamos el teclado con un función delegado al pulsar fuera de el en la pantalla
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        // Llamamos de nuevo a la función devolverPosicionInicial
        devolverPosicionInicial()
    }
    
    // Función delegados de texField para mostrar el teclado y desplazar la vista 200 píxeles hacia arriba
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        UIView.animateWithDuration(1) { () -> Void in
            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-200, self.view.frame.width, self.view.frame.height)
        }
        
        return true
    }
    
    // Creamos una función de alertas para las órdenes (alertView)
    func alertaOrden(){
        
        var mensaje: String = ""
        let textoCantidad = cantidadOrden.text!
        if textoCantidad != ""{
            mensaje = "Ha añadido \(textoCantidad) plato(s) de \(tituloDetalle.text!) a su pedido"
        }
        
        let alerOrden = UIAlertController(title: "Orden pedido", message: "\(mensaje)", preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alerOrden.addAction(defaultAction)
        presentViewController(alerOrden, animated: true, completion: nil)
    }
    
    // función para devlover al frame inicial la vista
    func devolverPosicionInicial(){
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        }
    }
    
    
    
    
    
}
