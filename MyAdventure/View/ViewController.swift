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
        var choices = game.getChoices()
        var count = choices.count
        for (index, button) in choiceButtons.enumerated() {
            if count > 0 {
                button.setTitle(choices[index].description, for: .normal)
                count -= 1
            } // disable or hide button
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    

}

