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
    
    init(_ title: String, _ desc: String = "", _ last : Bool = false) {
        self.title = title
        self.description = desc
        self.last = last
        self.choices = []
    }
    
    func listChoices() -> Array<Choice> {
        return choices
    }
    
    func describe() -> String {
        return description
    }
    
    func addChoice(_ choice : Choice) {
        self.choices.append(choice)
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
}
