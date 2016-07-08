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
        let alertController = UIAlertController(title: "Add new Item", message: "What re we randomizing today?", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField:UITextField) -> Void in
            textField.autocorrectionType = .Yes
            textField.delegate = self
        }
        
        
    }
    
    @IBAction func RandomizeItemsButtonTapped(sender: AnyObject) {
        
        var array = []
        /*
         func shuffleArray<T>(array: Array<T>) -> Array<T>
         {
         for var index = array.count - 1; index > 0; index--
         {
         // Random int from 0 to index-1
         var j = Int(arc4random_uniform(UInt32(index-1)))
         
         // Swap two array elements
         // Notice '&' required as swap uses 'inout' parameters
         swap(&array[index], &array[j])
         }
         return array
         }*/
        
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
        return PersonController.sharedInstance.people.count ?? 0
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
