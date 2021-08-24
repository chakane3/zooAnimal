//
//  BasicAnimalCellController.swift
//  zooAnimal
//
//  Created by Chakane Shegog on 8/24/21.
//

import UIKit

class BasicAnimalCellController: UIViewController {
    
    // MARK: - Outlets and Properties
    @IBOutlet weak var tableView: UITableView!
    var animals = [ZooAnimal]() {
        didSet { // property observer
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }
}

extension BasicAnimalCellController: UITableViewDelegate {}

extension BasicAnimalCellController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        
        // get current animal
        let animal = animals[indexPath.row]
        
        // configure cell to be a "subtitle"
        cell.imageView?.image = UIImage(named: animal.imageNumber.description)
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.origin
        
    
        return cell
    }
}
