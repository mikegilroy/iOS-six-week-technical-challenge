//
//  PairListTableViewController.swift
//  6 Week Challenge
//
//  Created by Mike Gilroy on 18/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class PairListTableViewController: UITableViewController {

    // MARK: Properties

    
    
    // MARK: Actions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func randomizeButtonTapped(sender: AnyObject) {
        PersonController.sharedInstance.randomizePairs()
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PersonController.sharedInstance.people.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)

        let currentPerson = PersonController.sharedInstance.people[indexPath.row]
        
        cell.textLabel?.text = currentPerson.name
        cell.detailTextLabel?.text = String(currentPerson.pairNumber)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let currentPerson = PersonController.sharedInstance.people[indexPath.row]
            PersonController.sharedInstance.removePerson(currentPerson)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } 
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editPerson" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let person = PersonController.sharedInstance.people[indexPath.row]
                    
                let detailScene = segue.destinationViewController as! AddNewViewController
                
                _ = detailScene.view
                detailScene.person = person
                detailScene.updateWithPerson(person)
            }
        }
    }
    

}
