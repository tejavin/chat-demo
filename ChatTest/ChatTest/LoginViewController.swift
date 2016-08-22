//
//  LoginViewController.swift
//  ChatTest
//
//  Created by SharkTony on 8/21/16.
//  Copyright © 2016 SharkTony. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let backendless = Backendless.sharedInstance()
    var email: String?
    var password: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
        
    @IBAction func loginBarButtonItemPressed(sender: UIBarButtonItem) {
        
        if emailTextfield.text != "" && passwordTextField.text != "" {
            
            self.email = emailTextfield.text
            self.password = passwordTextField.text
            
            
            loginUser(email!, password: password!)
            
        }else {
            ProgressHUD.showError("Please complete all fields")
        }
    }
    
    func loginUser(email: String, password: String) {
        
        backendless.userService.login(email, password: password, response: { (user : BackendlessUser!) -> Void in
            
            self.emailTextfield.text = ""
            self.passwordTextField.text = ""
            
            //segue to recents view
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChatVC") as! UITabBarController
            
            vc.selectedIndex = 0
            
            self.presentViewController(vc, animated: true, completion: nil)

            
        }) { (fault : Fault!) -> Void in
            
            print("couldnt login user \(fault)")
        
        }
        
    }
    
    
}
