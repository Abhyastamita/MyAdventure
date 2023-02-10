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
    
    init(_ title: String, desc: String = "") {
        self.title = title
        self.description = desc
        self.choices = []
    }
    
    func listChoices() -> Array<Choice> {
        return choices
    }
    
    func describe() -> String {
        return description
    }
}

class Choice {
    var description : String
    var destination : Situation?
    var last : Bool
    
    init(_ desc : String, _ last : Bool = false) {
        self.description = desc
        self.last = last
    }
    
    func describe() -> String {
        return description
    }
    
    func choose() -> Situation {
        return destination!
    }
}
