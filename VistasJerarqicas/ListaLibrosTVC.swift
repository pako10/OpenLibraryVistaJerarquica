//
//  ListaLibrosTVC.swift
//  VistasJerarqicas
//
//  Created by Francisco Humberto Andrade Gonzalez on 30/1/16.
//  Copyright © 2016 Francisco Humberto Andrade Gonzalez. All rights reserved.
//

import UIKit

class ListaLibrosTVC: UITableViewController {
    
    
    @IBOutlet weak var vistaLibros: UITableView!
    var libros : [[String]] = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de Libros"
        self.vistaLibros.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .Plain, target: self, action: "buscarPorISBN")
        //esto cambiar
        
        self.libros.append(["Harry Potter y la camara secreta", "9780747560722"])
        self.libros.append(["Don Quijote de la Mancha", "843030407X"])
        self.libros.append(["Mira a tu Suegra", "8496129292"])
        self.libros.append(["Guia Zombie", "8497349725"])
        

        self.vistaLibros.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.libros.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.libros[indexPath.row][0]
        return cell
    }


   

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let lvc = segue.destinationViewController as! LibroVC
        lvc.cIsbn = nil
        if let ip = self.vistaLibros.indexPathForSelectedRow {
            lvc.cIsbn = self.libros[ip.row][1]
        }
    }

    
    func buscarPorISBN() {
        performSegueWithIdentifier("obtenerLibro", sender: self)
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
        let lvc = segue.sourceViewController as! LibroVC
        print("return \(lvc.cISBN.text!)")
        if (lvc.cISBN.text! != "" ) {
            self.libros.append([lvc.titulo.text!,lvc.cISBN.text!])
        }
        self.vistaLibros.reloadData()
    }
    
}
