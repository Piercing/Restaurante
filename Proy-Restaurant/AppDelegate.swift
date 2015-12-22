//
//  AppDelegate.swift
//  Proy-Restaurant
//
//  Created by MacBook Pro on 16/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate{

    var window: UIWindow?
    var locationManager:CLLocationManager!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Inicializando el locationManager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Inicializar la BBDD
        DataBase.checkAndCreateDatabase()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        print("WillResignActive")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("DidEnterBackground")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        print("WillEnterForeground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("DidBecomeActive")
        // llamamos primero al método 'parserAndSincronyze()' para que lea primero
        // los datos del JSON y los inserte en la BBDD antes de pedirle los datos.
        parserAndSincronyze()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("WillTerminate")
    }
    func parserAndSincronyze(){
        
        // http://www.iphonecursoonline.com/cursoWS/web-service/listado.php
        let rutaJson = "http://www.iphonecursoonline.com/cursoWS/web-service/listado.php"
        
        // creamos un objeto URL
        let urlJson = NSURL(string: rutaJson)
        
        // Creamos el objeto datosJson, crea un binario del contenido JSON de tipo NSData
        let datosJson = NSData(contentsOfURL: urlJson!)
        
        do{
            //  Decode JSON
            func decodeJSON(dato:NSData)throws ->[AnyObject]? {
                
                let serializerJSON = try? NSJSONSerialization.JSONObjectWithData(dato,
                    options: NSJSONReadingOptions.MutableContainers) as! NSArray
                return serializerJSON as? [AnyObject]
            }
            
            // llamamos a la función decodeJson y le pasamos
            // los datos binarios obtenidos del JSON
            if let arrayDatosRecibidos: Array = try decodeJSON((datosJson)!){
                
                /*
                Una vez serializado el JSON procedemos a introducirlos en la BBDD
                */
                // instanciamos un objeto de 'DataBase'
                let objDAO = DataBase()
                // borramos el contenido de la tabla
                objDAO.ejecutarDelete("Delete From platos_comidas")
                
                // aseguramos el objeto recibido, que es un 'AnyObject', y
                // desempaquetamos el optional de forma segura con if let.
                if let arrayDatos : Array = arrayDatosRecibidos{
                    
                    // recorremos el array
                    for item in arrayDatos{
                        
                        let nombrePlato = (item["nombre"] as! String)
                        let descripcPlato = (item["descripcion"] as! String)
                        let precioPlato = (item["precio"] as! String)
                        let archivoPlato = (item["archivo"] as! String)
                        let categoriaPlato = (item["categoria"] as! String)
                        
                        // insertar los objetos json (platos) uno a uno en la tabla
                        objDAO.ejecutarInsert("insert into platos_comidas('nombre_plato','descripcion_plato','precio_plato','archivo_plato','id_categoria') values('\(nombrePlato)','\(descripcPlato)','\(precioPlato)','\(archivoPlato)','\(categoriaPlato)')")
                    }
                }
                
                print(arrayDatosRecibidos)
            }
        } catch let error as NSError {
            NSLog("%@", error.localizedDescription)
        }
    }

}

