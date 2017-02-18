//
//  LoginViewController.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/16/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, failure: Error?) in
            if let user = user{
                print("login. User is \(user)")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("not logged in")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text!
        newUser.password = passwordField.text!
        newUser.signUpInBackground { (success: Bool, failure: Error?) in
            if success{
                print("yay, created a User")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)

            }else{
                print("sign up fail")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
