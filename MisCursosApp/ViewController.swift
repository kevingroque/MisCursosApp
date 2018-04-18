//
//  ViewController.swift
//  MisCursosApp
//
//  Created by Hanzito on 17/04/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var cursos : [Cursos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cursoSeleccionadoSegue"{
            let siguienteVC = segue.destination as! DetalleCursoViewController
            siguienteVC.curso = sender as! Cursos
        }
    }
    
    @IBAction func agregarCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarCursoSegue", sender: nil)
    }
    
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(Cursos.fetchRequest()) as! [Cursos]
        } catch{
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        cell.textLabel?.text = "\(curso.nombre!)  \(curso.promedio)"
        if curso.promedio > 13 {
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "cursoSeleccionadoSegue", sender: curso)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let curso = cursos[indexPath.row]
            context.delete(curso)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                cursos = try context.fetch(Cursos.fetchRequest())
            }catch{
                print("ERROR AL ELIMINAR")
            }
        }
        
        tableView.reloadData()
    }
    
}

