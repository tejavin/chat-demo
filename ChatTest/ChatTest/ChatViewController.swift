//
//  ChatViewController.swift
//  ChatTest
//
//  Created by SharkTony on 8/22/16.
//  Copyright © 2016 SharkTony. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


class ChatViewController: JSQMessagesViewController {
    
    
    let ref = firebase.child("Message")
    
    var messages: [JSQMessage] = []
    var objects: [NSDictionary] = []
    var loaded:  [NSDictionary] = [] 
    var chatRoomId: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.senderId = backendless.userService.currentUser.objectId
        self.senderDisplayName = backendless.userService.currentUser.name

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
