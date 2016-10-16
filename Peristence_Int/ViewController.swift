//
//  ViewController.swift
//  testingpersistence2
//
//  Created by Fabian Wetekamp on 15/10/2016.
//  Copyright © 2016 Fabian Wetekamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var users = [Points]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedBalance = loadBalance(){
            users += savedBalance
        }else{
            loadSampleUsers()
        }
        let lastbalancestring:Int = (users.last?.balance)!
        lastsaveduser.text = String(lastbalancestring)
    }
    
    func  loadSampleUsers(){
        let user1 = Points(balance: 5)
        users = [user1!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lastsaveduser: UILabel!
    @IBOutlet weak var enternewuser: UITextField!
    
    @IBAction func updatebalance(_ sender: AnyObject) {
        let newvalue = enternewuser.text
        lastsaveduser.text = newvalue
        let newvalueint:Int = Int(newvalue!)!
        users.append(Points(balance: newvalueint)!)
        saveBalance()
    }
    
    
    func saveBalance(){
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(users, toFile: Points.ArchiveURL.path)
        if !isSuccessfullSave{
            print("Failed to save balance")
        }
    }
    
    func  loadBalance() -> [Points]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Points.ArchiveURL.path) as? [Points]
    }
    
    
}

