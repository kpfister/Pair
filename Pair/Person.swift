//
//  Person.swift
//  Pair
//
//  Created by Karl Pfister on 7/8/16.
//  Copyright © 2016 Karl Pfister. All rights reserved.
//

import Foundation

class Person: Equatable {
    
    private let nameKey = "name"
    
    var name: String
    
    var dictionaryCopy: [String: AnyObject] {
        return [nameKey: name]
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let name = dictionary[nameKey] as? String else {
            return nil
        }
        self.name = name
    }
    
    init(name: String) {
        self.name = name
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}