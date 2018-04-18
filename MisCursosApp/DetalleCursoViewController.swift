//
//  DetalleCursoViewController.swift
//  MisCursosApp
//
//  Created by Hanzito on 17/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class DetalleCursoViewController: UIViewController {

    @IBOutlet weak var txtNombre: UILabel!
    @IBOutlet weak var txtLab: UILabel!
    @IBOutlet weak var txtTeo: UILabel!
    @IBOutlet weak var txtExamen: UILabel!
    @IBOutlet weak var txtPromedio: UILabel!
    
    var curso = Cursos()

    override func viewDidLoad() {
        super.viewDidLoad()
        txtNombre.text = curso.nombre
        txtLab.text = String(curso.notaLab)
        txtTeo.text = String(curso.notaTeo)
        txtExamen.text = String(curso.notaExa)
        txtPromedio.text = String(curso.promedio)
    }

   

}
