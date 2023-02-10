//
//  gameLogic.swift
//  MyAdventure
//
//  Created by user232612 on 2/9/23.
//

import Foundation

let situations : Array<Situation> = [
    Situation("The beach", "Ugh. You wake up with sand in your mouth. You're feeling cold. This beach seemed like a good place to nap a few hours ago, but the sun is setting and all the tourists have left. Do you...?"),
    Situation("The edge of the water", "The water is really cold! You've heard some scary things about the currents here. Are you sure?"),
    Situation("The swirling maelstrom", "The rumors about the undertow were not exaggerated. You are swept out to sea where you perish. Do you want to play again?", true),
    Situation("The beach", "You are back by your stuff. Do you...?"),
    Situation("The path", "You are halfway back to the road when you spot something gleaming in the bushes off the side of the path. Do you...?"),
    Situation("The path", "You are now the proud owner of a shiny silver lighter. You flick it on to test it and it produces a mesmerizing flame. You hear shouting back on the beach.  Do you...?"),
    Situation("Home safe", "You make it back to your hotel and go straight to bed. Congratulations! You have survived by making extremely boring choices. Do you want to play again?", true),
    Situation("The edge of the seacave", "An old lady in a wheelchair with extra large sand tires has wheeled herself to the edge of the seacave.  She shouts, \"Romeo?  Romeo?  Come here Romeo!\"  Then she spots you. \"Will you help me save my Romeo?\""),
    Situation("The edge of the seacave", "\"Romeo is my cat. He ran into the cave and the tide is coming in. If no one rescues him, he'll be trapped!\"")
]

let choices : Array<Choice> = [
    Choice("Get in one last swim", situations[1]),
    Choice("Yes!", situations[2]),
    Choice("On second thought...", situations[3]),
    Choice("Pack up your stuff and head back into town", situations[4]),
    Choice("Pick it up", situations[5]),
    Choice("Go back and investigate the sea cave", situations[7]),
    Choice("Keep going back to town", situations[6]),
    Choice("Leave it alone. It might have cooties", situations[6]),
    Choice("Investigate the commotion going on by the seacave", situations[7]),
    Choice("Ask who Romeo is", situations[8]),
    Choice("Ask what happened", situations[8]),
    Choice("Say of course you'll help!", situations[8]), //Wrong situation
    Choice("You don't want to get trapped in the seacave either. Make an excuse and leave", situations[4]),
]

var pointer : Situation = situations[0]
let start : Situation = situations[0]
