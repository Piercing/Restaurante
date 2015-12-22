//
//  AppDelegate.swift
//  Proy-Restaurante
//
//  Created by fredy asencios (AppsLovers) on 22/02/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var locationManager:CLLocationManager!
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //inicilizando el locationManager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
        
        DataBase.checkAndCreateDatabase()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        println("WillResignActive")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        println("DidEnterBackground")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        println("WillEnterForeground")
        
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        println("DidBecomeActive")
        parsearySincronizar()

    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        println("WillTerminate")
    }

    func parsearySincronizar(){
        
        var rutaJson = "http://www.iphonecursoonline.com/cursoWS/web-service/listado.php"
        
        var urlJson = NSURL(string: rutaJson)
        
        var datoJson = NSData(contentsOfURL: urlJson!)
        
        func decodeJSON(dato:NSData)->[AnyObject]?{
            
            return NSJSONSerialization.JSONObjectWithData(dato, options: .allZeros, error: nil) as? Array
            
        }
        if let datoJson2 = datoJson{
        var arrayDatosRecibidos = decodeJSON(datoJson2)
        
        //borrar el contenido de la tabla
        var objDAO = DataBase()
        objDAO.ejecutarDelete("Delete From platos_comidas")
        //insertar los objetos json (platos) en la tabla
        
        if let arrayDatos:Array = arrayDatosRecibidos {
            
            var numObjArray = arrayDatos.count as Int
            
            for var index = 0;index < numObjArray ; ++index{
                
                var nomP = arrayDatos[index]["nombre"] as NSString
                var desP = arrayDatos[index]["descripcion"] as NSString
                var preP = arrayDatos[index]["precio"] as NSString
                var arcP = arrayDatos[index]["archivo"] as NSString
                var idC = arrayDatos[index]["categoria"] as NSString
                //insertar los objetos
                objDAO.ejecutarInsert("insert into platos_comidas('nombre_plato','descripcion_plato','precio_plato','archivo_plato','id_categoria') values('\(nomP)','\(desP)','\(preP)','\(arcP)','\(idC)')")
                
            }
            
            
        }
            println(arrayDatosRecibidos)
        }
        
       //
        
    }


}

