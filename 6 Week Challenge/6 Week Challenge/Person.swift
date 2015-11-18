//
//  Person.swift
//  6 Week Challenge
//
//  Created by Mike Gilroy on 18/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class  Person {
    
    
    var name: String
    var pairNumber: Int?
    
    init(name: String) {
        self.name = name
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[]
        
    }
    
    func dictionaryCopy(person: Person) -> [String: AnyObject] {
        
        
    }
    
    
}