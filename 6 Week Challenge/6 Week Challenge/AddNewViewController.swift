//
//  AddNewViewController.swift
//  6 Week Challenge
//
//  Created by Mike Gilroy on 18/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class AddNewViewController: UIViewController {

    
    // MARK: Properties/Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    
    var person: Person?
    
    // MARK: Actions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let name = self.nameTextField.text {
            if let oldPerson = self.person {
                PersonController.sharedInstance.removePerson(oldPerson)
            }
            let newPerson = Person(name: name)
            PersonController.sharedInstance.addPerson(newPerson)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    
    func updateWithPerson(person: Person) {
        self.nameTextField.text = person.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
