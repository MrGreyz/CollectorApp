//
//  ViewController.swift
//  ChekkiCollector
//
//  Created by Armani on 13/08/2017.
//  Copyright © 2017 Armani Cesar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chekkis : [Chekki] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            chekkis = try context.fetch(Chekki.fetchRequest())
            print(chekkis)
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chekkis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let chekki = chekkis[indexPath.row]
        cell.textLabel?.text = chekki.title
        cell.imageView?.image = UIImage(data: chekki.image as! Data)
        return cell
    }

}

