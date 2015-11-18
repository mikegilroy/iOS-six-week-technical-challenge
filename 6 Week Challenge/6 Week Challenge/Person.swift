//
//  Person.swift
//  6 Week Challenge
//
//  Created by Mike Gilroy on 18/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class  Person: Equatable {
    
    let kName = "name"
    let kPairNumber = "pair"
    
    var name: String
    var pairNumber: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[kName] as? String,
        let pairNumber = dictionary[kPairNumber] as? Int
        else {
            self.name = ""
            self.pairNumber = 1
            
            return nil
        }
        
        self.pairNumber = pairNumber
        self.name = name
    }
    
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary: [String: AnyObject] = [
            kName: name,
            kPairNumber: pairNumber
        ]
        return dictionary
    }
    
    
}


func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}