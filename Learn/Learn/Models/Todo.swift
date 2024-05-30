//
//  Todo.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state:Bool) {
        isDone = state
    }
}
