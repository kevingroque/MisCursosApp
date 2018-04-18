//
//  CrearCursoViewController.swift
//  MisCursosApp
//
//  Created by Hanzito on 17/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    
    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtNotaLab: UITextField!
    @IBOutlet weak var txtnotaTeo: UITextField!
    @IBOutlet weak var txtnotaExa: UITextField!
    
    var nLab:Double = 0
    var nTeo:Double = 0
    var nExa:Double = 0
    var nPro:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func agregar(_ sender: Any) {
        
        nLab = Double(txtNotaLab.text!)!
        nTeo = Double(txtnotaTeo.text!)!
        nExa = Double(txtnotaExa.text!)!
        nPro = Double((nLab*0.6)+(nTeo*0.3)+(nExa*0.1))
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Cursos(context: context)
        
        curso.nombre = txtNombreCurso.text!
        curso.notaLab = nLab
        curso.notaTeo = nTeo
        curso.notaExa = nExa
        curso.promedio = nPro
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
}
