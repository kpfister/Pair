//
//  RandomItemListTableViewController.swift
//  Pair
//
//  Created by Karl Pfister on 7/8/16.
//  Copyright © 2016 Karl Pfister. All rights reserved.
//

import UIKit

class RandomItemListTableViewController: UITableViewController, UITextFieldDelegate {
    

    @IBAction func AddItemButtonTapped(sender: AnyObject) {
        var personTextField: UITextField?
        let alertController = UIAlertController(title: "Add new Item", message: "Add names", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField:UITextField) -> Void in
            personTextField = textField
            textField.placeholder = "Full name"
            textField.autocorrectionType = .Yes
            textField.delegate = self
        }
        let addAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let name = personTextField?.text else { return }
            PersonController.sharedInstance.createPerson(name)
            self.tableView.reloadData()
        }
        alertController.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
            }
    
    @IBAction func RandomizeItemsButtonTapped(sender: AnyObject) {
        PersonController.sharedInstance.people.shuffle()
          }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return "Group \(section + 1)"
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("peopleTableViewCell", forIndexPath: indexPath)
        let person = PersonController.sharedInstance.people[indexPath.row]
        cell.textLabel?.text = person.name


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
