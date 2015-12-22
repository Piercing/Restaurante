//
//  MapaViewController.swift
//  Proy-Restaurante
//
//  Created by Fredy Asencios on 4/3/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var miMapa: MKMapView!
    
    
    @IBOutlet weak var miSegment: UISegmentedControl!
    
    
    @IBAction func cambioDeTipo(sender: AnyObject) {
        
        if  self.miSegment.selectedSegmentIndex == 0 {
        
        self.miMapa.mapType = MKMapType.Standard
        }
        if  self.miSegment.selectedSegmentIndex == 1 {
            
            self.miMapa.mapType = MKMapType.Satellite
        }
        if  self.miSegment.selectedSegmentIndex == 2 {
            
            self.miMapa.mapType = MKMapType.Hybrid
        }
        
        
    }
    
    
    @IBAction func salirMapa(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        self.miMapa.delegate = self
        
        super.viewDidLoad()
        let rutaFile = NSBundle.mainBundle().pathForResource("locales", ofType: "plist")
        var arrayLocales:NSArray = NSArray(contentsOfFile: rutaFile!)! as NSArray
        
        for object in arrayLocales{
            
            let latiLocal:CLLocationDegrees = (object["latitud"] as NSString).doubleValue
            let longLocal:CLLocationDegrees = (object["longitud"] as NSString).doubleValue
            let tituloLocal = object["nombre"] as NSString
            let subTituloLocal = object["descripcion"] as NSString
            agregarPuntosMapa(latiLocal, longitud: longLocal, titulo: tituloLocal, subtitulo: subTituloLocal)
        }
        //llamando a funcion agregarRegion
        var centroRegion:NSDictionary   = arrayLocales.firstObject as NSDictionary
        let latitudRegion:CLLocationDegrees = (centroRegion["latitud"] as NSString).doubleValue
        let longitudRegion:CLLocationDegrees = (centroRegion["longitud"] as NSString).doubleValue
        
        agregarRegion(latitudRegion, longitud: longitudRegion)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func agregarPuntosMapa(latitud:CLLocationDegrees , longitud:CLLocationDegrees , titulo:NSString, subtitulo:NSString){
        
        var annotarionCoord = CLLocationCoordinate2DMake(latitud, longitud)
        
        var annotationPoint = MKPointAnnotation()
        annotationPoint.coordinate = annotarionCoord
        annotationPoint.title = titulo
        annotationPoint.subtitle = subtitulo
        
        self.miMapa.addAnnotation(annotationPoint)
        
        
    }
  
    func agregarRegion (latitud:CLLocationDegrees , longitud:CLLocationDegrees){
        
        var annotarionCenter = CLLocationCoordinate2DMake(latitud, longitud)
        var spanRegion = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        var regionToAdd = MKCoordinateRegionMake(annotarionCenter, spanRegion)
        self.miMapa.setRegion(regionToAdd, animated: true)
    }

    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if !(annotation is MKPointAnnotation){
        
        return nil
        }
        
        let reuseId = "test"
        
        var  anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView.image = UIImage(named: "pin1.png")
            anView.canShowCallout = true
        
        
        }
        else{
        
            anView.annotation = annotation
        }
        return anView
    }

}
