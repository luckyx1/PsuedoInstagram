//
//  SignUpViewController.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/18/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSignup(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameLabel.text!
        newUser.password = passwordLabel.text!
        newUser.signUpInBackground { (success: Bool, failure: Error?) in
            if success{
                print("yay, created a User")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }else{
                print("sign up fail")
            }
        }
    }

    @IBAction func OnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
