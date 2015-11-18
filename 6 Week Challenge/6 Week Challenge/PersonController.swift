//
//  PersonController.swift
//  6 Week Challenge
//
//  Created by Mike Gilroy on 18/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class  PersonController  {
    
    static let sharedInstance = PersonController()
    private let kPeople = "people"
    
    var people: [Person] = []
    
    init() {
        self.people = []
        self.loadFromPersistentStorage()
    }
    
    func randomizePairs() {
      
        
    }
    
    func addPerson(person: Person) {
        people.append(person)
        self.saveToPersistentStorage()
    }
    
    func removePerson(person: Person) {
        if let index = people.indexOf(person) {
            people.removeAtIndex(index)
        }
        self.saveToPersistentStorage()
    }
    
    
    func saveToPersistentStorage() {
        let peopleDictionary = people.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setValue(peopleDictionary, forKey: kPeople)

    }
    
    func loadFromPersistentStorage() {
        let peopleDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPeople) as? [Dictionary<String, AnyObject>]
        
        if let peopleDictionary = peopleDictionariesFromDefaults {
            self.people = peopleDictionary.map({Person(dictionary: $0)!})
        }
    }
    
}