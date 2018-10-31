//
//  ViewController.swift
//  peliculasrafa
//
//  Created by Alumno on 31/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire
// Heredar los protocolos
//Data source y Delegate
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94.5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datos.resultadosPeliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellResultadoPelicula") as! CeldaPeliculaController
        celda.lblTitulo.text = Datos.resultadosPeliculas[indexPath.row].titulo
        celda.lblAño.text = "\(Datos.resultadosPeliculas[indexPath.row].año)"
        return celda
    }
    

    @IBOutlet weak var aiCargando: UIActivityIndicatorView!
    @IBOutlet weak var txtBusqueda: UITextField!
    @IBOutlet weak var tvResultadosPeliculas: UITableView!
    @IBAction func doTapBuscarPelicula(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://www.omdbapi.com/?apikey=4799d46a&s=godfather").responseJSON {
            response in
            
            Datos.resultadosPeliculas.removeAll()
            
            if let dictResponse = response.result.value as? NSDictionary {
                if let arrResultados = dictResponse.value(forKey: "Search") as? NSArray {
                    for resultado in arrResultados {
                        if let dictResultado = resultado as?
                            NSDictionary {
                            let nuevoResultado = Pelicula(diccionario: dictResultado)
                            
                            Datos.resultadosPeliculas.append(nuevoResultado)
                        }
                }
                    self.tvResultadosPeliculas.reloadData()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }
}

