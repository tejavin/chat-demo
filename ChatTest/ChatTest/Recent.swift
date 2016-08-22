//
//  Recent.swift
//  ChatTest
//
//  Created by SharkTony on 8/21/16.
//  Copyright © 2016 SharkTony. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase


var firebase = FIRDatabase.database().reference()
let backendless = Backendless.sharedInstance()
let currentUser = backendless.userService.currentUser


//MARK:     Helper functions

private let dateFormat = "yyyyMMddHHmmss"

func dateFormatter() -> NSDateFormatter {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = dateFormat
    
    return dateFormatter
}