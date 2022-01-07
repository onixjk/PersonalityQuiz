//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public Properties
    
    var results: [Answer]!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        showResult()
        
    }
    
    // MARK: - Private Methods
    
    private func showResult() {
        var frequentAnimal: [Animal : Int] = [:]
        
        let animals = results.map { $0.animal }
        
        for animal in animals {
            if let value = frequentAnimal[animal] {
                frequentAnimal.updateValue(value + 1, forKey: animal)
            } else {
                frequentAnimal[animal] = 1
            }
        }
        
        let sortedFrequentAnimal = frequentAnimal.sorted { $0.value > $1.value }
        
        if let mostFrequencyAnimal = sortedFrequentAnimal.first?.key {
            animalLabel.text = "Вы - \(mostFrequencyAnimal.rawValue)"
            descriptionLabel.text = "Вы - \(mostFrequencyAnimal.rawValue)"
        }
    }
}
