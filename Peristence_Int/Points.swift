//
//  User.swift
//  testingpersistence2
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//
//


import UIKit

class Points: NSObject, NSCoding {
    // MARK: Properties
    var balance: Int
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("mamrpoints6")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "balance"
    }
    
    // MARK: Initialisation
    
    init?(balance: Int) {
        // Initialize stored properties.
        self.balance = balance
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        
    }
    
    func  encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: "balance")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.balance = aDecoder.decodeInteger(forKey: "balance")
        super.init()
    }
}
