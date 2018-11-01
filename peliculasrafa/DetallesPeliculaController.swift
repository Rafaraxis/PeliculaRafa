//
//  DetallesPeliculaController.swift
//  peliculasrafa
//
//  Created by Alumno on 01/11/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DetallespeliculaController : UIViewController {
    
    var pelicula : Pelicula?
    let urlBase = "https://www.omdbapi.com/?apikey=4799d46a&s="
    @IBAction func doTapAtras(_ sender: Any) {
    }
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblAño: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblClasificacion: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    override func viewDidLoad() {
        
            super.viewDidLoad()
        
        if pelicula != nil {
            lblTitulo.text = pelicula!.titulo
            lblAño.text = "\(pelicula!.año)"
            Alamofire.request("\(urlBase)\(pelicula!.id!)").responseJSON{
                response in
                if let dictResultado = response.result.value as? NSDictionary
                {
                    /*
                     clasificacion
                     genero
                     director
                     duracion
                    */
                    
                    if let clasificacion = dictResultado.value(forKey: "Rated") as?
                        String {
                        self.pelicula?.clasificacion = clasificacion
                        self.lblClasificacion.text = clasificacion
                    }
                    if let director = dictResultado.value(forKey: "Director") as?
                        String {
                        self.pelicula?.director = director
                        self.lblDirector.text = director
                    }
                    
                }
            }
        }
        }
    }

