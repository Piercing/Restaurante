//
//  MapaViewController.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 18/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit
import MapKit


// Utilizamos el MKMapViewDelegate el cual nos va a permitir cambiar el
// pin  de ubicación a una imagen que le pasamos con uno de sus métodos
class MapaViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var miMapa: MKMapView!
    
    
    @IBOutlet weak var miSegment: UISegmentedControl!
    
    
    @IBAction func cambioTipoMapa(sender: AnyObject) {
        
        if miSegment.selectedSegmentIndex == 0{
            self.miMapa.mapType = MKMapType.Standard
        }
        if miSegment.selectedSegmentIndex == 1{
            self.miMapa.mapType = MKMapType.Satellite
        }
        if miSegment.selectedSegmentIndex == 2{
            self.miMapa.mapType = MKMapType.Hybrid
        }
    }
    
    
    
    @IBAction func salirMapa(sender: AnyObject) {
        
        // AL pulsar el botón cerramos la View del mapa
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hacemos que el delegado de 'miMapa', de esta clase(self), acepte que el mismo sea el
        // delegado ya que le hemos dicho a la clase que acepte como delegado con 'MKMapViewDelegate'
        self.miMapa.delegate = self
        
        // Recuperamos los datos del contenido del fichero de Info.plist
        // Nos situamos en el 'bundle' de 'plist' y accedemos al fichero 'plist'
        let rutaFile = NSBundle.mainBundle().pathForResource("locales", ofType: "plist")
        let arrayLocales:NSArray = NSArray(contentsOfFile: rutaFile!)! as NSArray
        
        // recuperamos valor por valor
        for item in arrayLocales{
            
            // Constante que almacena la latitud mediante 'CLLocationDegrees'
            // un dato de tipo float que es especial para mapas, lo casteamos.
            let latitudLocal:CLLocationDegrees = (item["latitud"] as! NSString).doubleValue
            let longitudLocal:CLLocationDegrees = (item["longitud"] as! NSString).doubleValue
            let tituloLocal = item["nombre"] as! String
            let subtituloLocal = item["descripcion"] as! String
            // Llamamos al método y le pasamos los valores del fichero 'plist'
            insertarPuntosMapa(latitudLocal, longitud: longitudLocal, titulo: tituloLocal, subtitulo: subtituloLocal)
        }
        
        // LLamando a la función 'insertarRegion'
        // Recuperamos del arrayLocales el primer objeto para pasárselo y poder definir la región
        let centroRegion : NSDictionary =  arrayLocales.firstObject as! NSDictionary
        let latitudRegion: CLLocationDegrees = (centroRegion["latitud"]as! NSString).doubleValue
        let longitudRegion: CLLocationDegrees =  (centroRegion["longitud"]as! NSString).doubleValue
        insertarRegion(latitudRegion, longitud: longitudRegion)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Función para insertar los puntos en el mapa, no devuelve nada,
    // solamente de forma secuencial va a colocar los puntos en el mapa.
    func insertarPuntosMapa(latitud:CLLocationDegrees, longitud:CLLocationDegrees, titulo: String, subtitulo: String){
        
        // coordenadas en un solo objeto teniendo la latitud y longitud
        let annotationCoord = CLLocationCoordinate2DMake(latitud, longitud)
        // Instaciamos un objeto para pasarle las coordenadas del punto
        let annotationPoint = MKPointAnnotation()
        annotationPoint.coordinate = annotationCoord
        annotationPoint.title = titulo
        annotationPoint.subtitle = subtitulo
        // Accedemos dede esta clase al mapa y le pasamos el objeto creado, punto (annotationPoint).
        // NOTA: cada vez que se llama a esta función va a ir colocando un punto nuevo en el mapa.
        self.miMapa.addAnnotation(annotationPoint)
    }
    
    // Función para insertar la región
    func insertarRegion(latitud:CLLocationDegrees, longitud:CLLocationDegrees){
        
        // Creamos la variable centro
        let annotationCenter = CLLocationCoordinate2DMake(latitud, longitud)
        // Creamos el span de la región
        let spanRegion = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        // Añadimos la región que hemos creado con estas dos variables
        let regionToAdd = MKCoordinateRegionMake(annotationCenter, spanRegion)
        // Accedemos dede esta clase al mapa y le pasamos el objeto creado, región (regionToAdd)
        self.miMapa.setRegion(regionToAdd, animated: true)
        
    }
    
    // Implementamos la función 'mapView' para que nos devuelva una 'MKAnnotationView'
    // y poder cambiar el pin del mapa por una imagen nuestra.
    // NOTA: esta función la implementamos gracias a que a la clase le hemos dicho que 
    // implemente el protocolo 'MKMapViewDelegate'
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        // si no existe un punto de anotación
        if !(annotation is MKPointAnnotation){
            return nil
        }
        
        // definimos una constante de tipo String que nos va a servir como identificador para que
        // nos ayude a declarar una variable 'anView' que va a representar cada punto de la anotación.
        // Le pasamos el nombre de string que queramos.
        let reuseID = "test"
        
        // Nos da el identificador donde están situados los pins en el mapa
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseID)
        
        if anView == nil{
            // Redefinimos la anotación
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            // Establecemos la imagen
            anView!.image = UIImage(named: "pin1.png")
            // Hacemos que se visualice
            anView?.canShowCallout = true
        }else{
            // Si ya ha sido definifo lo mantine con al annotation definida
            anView?.annotation = annotation
        }
        return anView
    }
    
    
    
    
    
    
    
}







