//
//  ResultViewController.swift
//  PersonalQuizz
//
//  Created by Alexey on 11.03.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answer: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        
        var repeatAnimals: [Animal: Int] = [:]
        let animals = answer.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = repeatAnimals[animal] {
                repeatAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                repeatAnimals[animal] = 1
            }
        }
        
        let sortedRepeatAnimals = repeatAnimals.sorted { $0.value > $1.value }
        guard let mostRepeatAnimals = sortedRepeatAnimals.first?.key else { return }
        
        updateUI(with: mostRepeatAnimals)
    }
    
    private func updateUI(with animal: Animal) {
        resultLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
