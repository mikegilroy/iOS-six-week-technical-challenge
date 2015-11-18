//
//  Person.swift
//  6 Week Challenge
//
//  Created by Mike Gilroy on 18/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class  Person {
    
    let kName = "name"
    let kPairNumber = "pair"
    
    var name: String
    var pairNumber: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String else {
            self.name = ""
            self.pairNumber = 1
            
            return nil
        }
        
        if let pairNumber = dictionary[kPairNumber] as? Int {
            self.pairNumber = pairNumber
        }
        
        self.name = name
    }
    
    func dictionaryCopy(person: Person) -> [String: AnyObject] {
        let dictionary: [String: AnyObject] = [
            kName: name,
            kPairNumber: pairNumber
        ]
        return dictionary
    }
    
    
}