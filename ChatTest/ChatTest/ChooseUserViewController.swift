//
//  ChooseUserViewController.swift
//  ChatTest
//
//  Created by SharkTony on 8/21/16.
//  Copyright © 2016 SharkTony. All rights reserved.
//

import UIKit

protocol ChooseUserDelegate {
    func chreatChatroom(withUser: BackendlessUser)
}

class ChooseUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: ChooseUserDelegate!
    var users: [BackendlessUser] = []
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: UITableviewDataSorce
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
    
    //MARK: UITableviewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let user = users[indexPath.row]
        
        delegate.chreatChatroom(user)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: IBactions
    @IBAction func cancelButtonPressed(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    //MARK: Load Backendless Users
    
    func loadUsers() {
        
        let whereClause = "objectId != '\(backendless.userService.currentUser.objectId)'"
        
        let dataQuery = BackendlessDataQuery()
        dataQuery.whereClause = whereClause
        
        let dataStore = backendless.persistenceService.of(BackendlessUser.ofClass())
        dataStore.find(dataQuery, response: { (users : BackendlessCollection!) -> Void in
            self.users = users.data as! [BackendlessUser]
            self.tableView.reloadData()
        
            
            
        }) { (fault : Fault!) -> Void in
            print("Error, couldnt retrive users: \(fault)")
        }
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
