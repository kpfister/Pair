//
//  PersonController.swift
//  Pair
//
//  Created by Karl Pfister on 7/8/16.
//  Copyright © 2016 Karl Pfister. All rights reserved.
//

import Foundation

class PersonController {
    
    private let personKey = "person"
    
    static let sharedInstance = PersonController()
    
    var people = [Person]()
    
    init() {
        loadFromPersistenStorage()
    }
    func createPerson(name: String) {
        let person = Person(name:name)
        people.append(person)
        saveToPersistentStorage()
        
    }
    func addPerson(person: Person) {
        guard let indexOfPerson = people.indexOf(person) else {
            return
        }
        people.removeAtIndex(indexOfPerson)
        saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(people.map({$0.dictionaryCopy}), forKey: personKey)
    }
    
    func loadFromPersistenStorage() {
        guard let peopleDictionary = NSUserDefaults.standardUserDefaults().objectForKey(personKey) as? [[String:AnyObject]] else {
            return
        }
        people = peopleDictionary.flatMap({Person(dictionary: $0)})
    }
    

}

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
        }
    }
}