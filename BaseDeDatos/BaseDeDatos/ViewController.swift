//
//  ViewController.swift
//  BaseDeDatos
//
//  Created by MacBook Pro on 17/12/15.
//  Copyright © 2015 Juan Carlos Merlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializar la librería DataBase
        // copia nuestro fichero de recursos dentro del área de 'Documents del fileSystem'
        // Esta función es una función de clase, no necesita de una isntancia, el resto si.
        DataBase.checkAndCreateDatabase()
        
        // Creamos un objeto de la isntancia de clase 'DataBase'
        let ojbDAO = DataBase()
        
        // Usamos la instancia mediante una función recuperando todo el contenido de la tabla Datos
        // Devuelve un array, que tiene la particularidad de ser un array de objetos y cada objeto
        // es un NSDIctionary. De este diccionario tenemos que extraer cada uno de los elementos
        // para poder recuperar cualquier objeto del array.
        let arrayDatos = ojbDAO.ejecutarSelect("select * from platos") as Array
        
        // Comprobamos el contenido, si es que el array contiene toda la información de la tabla
        print("Contenido del array \(arrayDatos)")
        
        // Recuperar y leer el contenido de un registro determinado
        
        // mostrando imagen desde la BBDD
        if let imagenPlato1 = arrayDatos[0]["imagen"] as? String{
            contentImage.image = UIImage(named: imagenPlato1)        }
        
        if let nombrePlato2 = arrayDatos[1]["nombre"] as? String{
            print("Nombre del plato del segundo elemento del array: \(nombrePlato2)")
        }
        
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

