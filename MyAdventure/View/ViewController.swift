//
//  ViewController.swift
//  MyAdventure
//
//  Created by user232612 on 2/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    var game = gameLogic()
    
    @IBOutlet weak var situationTitle: UILabel!
    @IBOutlet weak var situationDescription: UILabel!
    
    @IBOutlet var choiceButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        game.setUpGame()
        updateUI()
    }
    
    func updateUI() {
        situationTitle.text = game.getSituationTitle()
        situationDescription.text = game.describeSituation()
        let choices = game.getChoices()
        var count = choices.count
        for (index, button) in choiceButtons.enumerated() {
            if count > 0 {
                button.isEnabled = true
                button.setTitle(choices[index].description, for: .normal)
                count -= 1
            } else {
                button.setTitle("", for: .normal)
                button.isEnabled = false
            }
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let choiceText = sender.titleLabel!.text
        let choices = game.getChoices()
        let choice = choices.first(where: {$0.description == choiceText})
        game.makeAChoice(choice: choice!)
        updateUI()
    }
    

}

