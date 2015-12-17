//
//  ViewController.swift
//  ParserJson
//
//  Created by fredy asencios (AppsLovers) on 19/03/15.
//  Copyright (c) 2015 iphone4peru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //http://www.iphonecursoonline.com/cursoWS/web-service/listado.php
        
        var rutaJson = "http://www.iphonecursoonline.com/cursoWS/web-service/listado.php"
        
        var urlJson = NSURL(string: rutaJson)
        
        var datoJson = NSData(contentsOfURL: urlJson!)
        
        func decodeJSON(dato:NSData)->[AnyObject]?{
        
        return NSJSONSerialization.JSONObjectWithData(dato, options: .allZeros, error: nil) as? Array
            
        }
       
        var arrayDatosRecibidos = decodeJSON(datoJson!)
        //var arrayFinal:Array = arrayDatosRecibidos! as Array
        if let arrayFinal:Array = arrayDatosRecibidos{
        println(arrayDatosRecibidos)
        var arrayDatosRecibidos = arrayFinal[1]["nombre"]! as NSString
        println("el nombre del segundo objeto es: \(arrayDatosRecibidos)")
        }else{
        println("avisar al usuario que revise internet")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

