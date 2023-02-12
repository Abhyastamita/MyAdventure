//
//  gameLogic.swift
//  MyAdventure
//
//  Created by user232612 on 2/9/23.
//

import Foundation

class gameLogic {
    
    var choices : Array<Choice>
    var pointer : Situation
    var situations : Array<Situation>
    
    init() {
        self.situations = [
            Situation("The beach", "Ugh. You wake up with sand in your mouth. You're feeling cold. This beach seemed like a good place to nap a few hours ago, but the sun is setting and all the tourists have left. Do you...?", 0), //0
            Situation("The edge of the water", "The water is really cold! You've heard some scary things about the currents here. Are you sure?", 1), //1
            Situation("The swirling maelstrom", "The rumors about the undertow were not exaggerated. You are swept out to sea where you perish. Do you want to play again?", 2, true), //2
            Situation("The beach", "You are back by your stuff. Do you...?", 3), //3
            Situation("The path", "You are halfway back to the road when you spot something gleaming in the bushes off the side of the path. Do you...?", 4), //4
            Situation("The path", "You are now the proud owner of a shiny silver lighter. You flick it on to test it and it produces a mesmerizing flame. You hear shouting back on the beach.  Do you...?", 5), //5
            Situation("Home safe", "You make it back to your hotel and go straight to bed. Congratulations! You have survived by making extremely boring choices. Do you want to play again?", 6, true), //6
            Situation("The edge of the seacave", "An old lady in a wheelchair with extra large sand tires has wheeled herself to the edge of the seacave.  She shouts, \"Romeo?  Romeo?  Come here Romeo!\"  Then she spots you. \"Will you help me save my Romeo?\"", 7), //7
            Situation("The edge of the seacave", "\"Romeo is my cat. He ran into the cave and the tide is coming in. If no one rescues him, he'll be trapped!\"", 8), //8
            Situation("Dark Cave", "It is pitch black. You are likely to be eaten by a grue", 9), //9
            Situation("The edge of the seacave", "The old lady understands about grues. \"I used to have a lighter, but Romeo made off with it and hid it somewhere,\" she tells you regretfully.", 10), //10
            Situation("Cave that you can see dimly by the light of a single wavering flame", "You are standing in a few inches of water near the mouth of the cave. The water rises and falls with the ocean. You can hear the sound of the surf and also a distant roaring that makes you think of a waterfall. There are glowing eyes in the darkness.", 11), //11
            Situation("Inside a stomach", "You have been eaten by a grue. Do you want to play again?", 12, true), //12
            Situation("The edge of the seacave", "The old lady is not happy to see you without her cat.", 13), //13
            Situation("The cave", "The roaring gets louder. Romeo rubs against your ankles.", 14), //14
            Situation("The edge of the seacave", "You escape just as water rushes into the cave. Romeo jumps out of your arms and immediately settles on his owner's lap. The old lady thanks you profusely.  Good job! You not only survived but you saved the day! Do you want to play again?", 15), //15
            Situation("Water everywhere", "The roaring is deafening. Suddenly water rushes into the cave. Romeo dives down a tunnel that probably leads to the surface. But it's too small for you to follow and you die a watery death. Do you want to play again?", 16) //16
        ]
        self.choices = []
        pointer = situations[0]
    }
    
    func setUpGame() {
        self.choices = generateChoices(situations: situations)
        attachChoices()
    }
    
    private func generateChoices(situations : Array<Situation>) -> Array<Choice> {
        return [
            Choice("Get in one last swim", situations[1]), //0
            Choice("Yes!", situations[2]), //1
            Choice("On second thought...", situations[3]), //2
            Choice("Pack up your stuff and head back into town", situations[4]), //3
            KeyChoice("Pick it up", situations[5], obtainLight), //4
            Choice("Go back and investigate the sea cave", situations[7]), //5
            Choice("Keep going back to town", situations[6]), //6
            Choice("Leave it alone. It might have cooties", situations[6]), //7
            Choice("Investigate the commotion going on by the seacave", situations[7]), //8
            Choice("Ask who Romeo is", situations[8]), //9
            Choice("Ask what happened", situations[8]), //10
            Choice("Say of course you'll help!", situations[9]), //11
            Choice("You don't want to get trapped in the seacave either. Make an excuse and leave", situations[4]), //12
            KeyChoice("Yes!", situations[0], resetGame), //13
            Choice("Climb back out of the cave", situations[10]), //14
            Choice("Go back to the beach", situations[3]), //15
            Choice("Head back to town", situations[4]), //16
            Choice("Do grues have glowing eyes? You aren't sure. Better to go back to the surface.", situations[13]), //17
            Choice("Slink back shamefaced to your hotel", situations[6]), //18
            Choice("Find your courage and venture back into the cave", situations[11]), //19
            Choice("Call Romeo", situations[14]), //20
            Choice("Ignore the cat and explore the seacave", situations[14]), //21
            Choice("Grab the cat and get out as fast as you can!", situations[15]), //22
            Choice("What's life without a little danger? Keep exploring.", situations[16]), //23
            Choice("Keep exploring in the dangerous darkness.", situations[12]) //24
        ]
        
        
    }
    
    
    // Add choices
    private func attachChoices() {
        situations[0].addChoice(choices[0])
        situations[0].addChoice(choices[3])
        situations[0].addChoice(choices[8])
        situations[1].addChoice(choices[1])
        situations[1].addChoice(choices[2])
        situations[2].addChoice(choices[13])
        situations[3].addChoice(choices[3])
        situations[3].addChoice(choices[8])
        situations[4].addChoice(choices[4])
        situations[4].addChoice(choices[7])
        situations[5].addChoice(choices[6])
        situations[5].addChoice(choices[5])
        situations[6].addChoice(choices[13])
        situations[7].addChoice(choices[9])
        situations[7].addChoice(choices[10])
        situations[7].addChoice(choices[11])
        situations[8].addChoice(choices[11])
        situations[8].addChoice(choices[12])
        situations[9].addChoice(choices[14])
        situations[9].addChoice(choices[24])
        situations[10].addChoice(choices[15])
        situations[10].addChoice(choices[16])
        situations[11].addChoice(choices[17])
        situations[11].addChoice(choices[20])
        situations[11].addChoice(choices[21])
        situations[12].addChoice(choices[13])
        situations[13].addChoice(choices[18])
        situations[13].addChoice(choices[19])
        situations[14].addChoice(choices[22])
        situations[14].addChoice(choices[23])
        situations[15].addChoice(choices[13])
        situations[16].addChoice(choices[13])
    }
    
    func obtainLight() {
        if choices.count > 0 {
            choices[11].changeDestination(situations[11])
        }
    }
    
    func resetGame() {
        if choices.count > 0 {
            choices[11].changeDestination(situations[9])
            pointer = situations[0]
        }
    }

    func makeAChoice(choice : Choice) {
        pointer = choice.choose()
    }
    
    func describeSituation() -> String{
        return pointer.describe()
    }
    
    func getSituationTitle() -> String{
        return pointer.getTitle()
    }
    
    func getChoices() -> Array<Choice> {
        return pointer.listChoices()
    }
    
    func getID() -> Int {
        return pointer.getID();
    }
    
}
