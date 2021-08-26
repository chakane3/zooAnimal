//
//  CustomCellViewController.swift
//  zooAnimal
//
//  Created by Chakane Shegog on 8/25/21.
//

import UIKit

class CustomCellViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var animals = [ZooAnimal]() {  // data for our table view
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self 
        loadData()
    }
    
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }
}

extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            fatalError("failed to dequeue an AnimalCell") // crashes if AnimalCell is not setup correctly
        }
        
        // get the current object (animal) at the index path
        let animal = animals[indexPath.row]
        
        // configure the cell
        cell.configureCell(for: animal) // we wrote this function in our cell class
        
        
        return cell
    }
}

extension CustomCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
