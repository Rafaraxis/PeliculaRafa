//
//  Pelicula.swift
//  peliculasrafa
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation

class Pelicula {
    
    var titulo : String
    var año : Int
    var id : String?
    var clasificacion : String?
    var genero : String?
    var director : String?
    
    init (titulo : String, año : Int){
        self.titulo = titulo
        self.año = año
    }
    init(diccionario : NSDictionary) {
        titulo = ""
        año = 0
        if let valorTitulo = diccionario.value(forKey: "Title") as? String {
            titulo = valorTitulo
        }
        if let valorAño = diccionario.value(forKey: "Year") as? String {
            let indiceFinal = valorAño.index(valorAño.startIndex,offsetBy: 4)
            año = Int(valorAño[..<indiceFinal])!
        }
        if let imdbID = diccionario.value(forKey: "imdbID") as? String {
            self.id = imdbID
        }
    }
}

