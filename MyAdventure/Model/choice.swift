//
//  choice.swift
//  MyAdventure
//
//  Created by user232612 on 2/9/23.
//

import Foundation

class Situation {
    var title : String
    var description : String
    var choices : Array<Choice>
    var last : Bool
    var id: Int
    
    init(_ title: String, _ desc: String = "",_ id : Int, _ last : Bool = false) {
        self.title = title
        self.description = desc
        self.last = last
        self.id = id
        self.choices = []
    }
    
    func listChoices() -> Array<Choice> {
        return choices
    }
    
    func describe() -> String {
        return description
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getID() -> Int {
        return id
    }
    
    func addChoice(_ choice : Choice) {
        self.choices.append(choice)
    }
    func removeChoices() {
        self.choices.removeAll()
    }
}

class Choice {
    var description : String
    var destination : Situation?
    
    init(_ desc : String, _ destination : Situation?) {
        self.description = desc
        self.destination = destination
    }
    
    func describe() -> String {
        return description
    }
    
    func choose() -> Situation {
        return destination!
    }
    
    func changeDestination(_ newDestination : Situation) {
        self.destination = newDestination
    }
}

class KeyChoice : Choice {
    var action : () -> Void
    init(_ desc : String, _ destination : Situation?,_ action : @escaping () -> Void) {
        self.action = action
        super.init(desc, destination)
    }
    override func choose() -> Situation {
        self.action() // Run the function that does something when you make this choice.
        return destination!
    }
}
