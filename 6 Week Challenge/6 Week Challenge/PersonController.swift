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
    
    func shufflePeople(var people: [Person]) {
        let numPeople = people.count
        if numPeople < 2 {
            self.people = people
        } else {
            for idx in 0..<people.count {
                let rnd = Int(arc4random_uniform(UInt32(idx)))
                if rnd != idx {
                    swap(&people[idx], &people[rnd])
                }
            }
        }
    }
    
    func randomizePairs() {
        let numPeople = self.people.count
        let numPairs = numPeople / 2
        
        self.people.shuffle()
        
        if numPeople % 2 == 0 {
            var index = 0
            for pair in 1...numPairs {
                let person1 = self.people[index]
                index++
                let person2 = self.people[index]
                index++
                
                person1.pairNumber = pair
                person2.pairNumber = pair
            }
        } else {
            var index = 0
            for pair in 1...numPairs {
                let person1 = self.people[index]
                index++
                let person2 = self.people[index]
                index++
                
                person1.pairNumber = pair
                person2.pairNumber = pair
            }
            let oddPerson = self.people[numPeople - 1]
            oddPerson.pairNumber = numPairs + 1
        }
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