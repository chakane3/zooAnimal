//
//  AnimalCell.swift
//  zooAnimal
//
//  Created by Chakane Shegog on 8/25/21.
//

import UIKit

class AnimalCell: UITableViewCell {
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalOriginLabel: UILabel!
    @IBOutlet weak var animalClassificationLabel: UILabel!
    
    func configureCell(for animal: ZooAnimal) {
        animalImageView.image = UIImage(named: animal.imageNumber.description)
        animalNameLabel.text = animal.name
        animalOriginLabel.text = animal.origin
        animalClassificationLabel.text = animal.classification
    }

}
