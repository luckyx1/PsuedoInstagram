//
//  ComposeViewController.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/17/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var caption: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onImageSubmit(_ sender: Any) {
        //Post.postUserImage(image: <#T##UIImage?#>, withCaption: <#T##String?#>, withCompletion: <#T##PFBooleanResultBlock?##PFBooleanResultBlock?##(Bool, Error?) -> Void#>)
        self.dismiss(animated: true, completion: nil)
        print("Submitting Picture!")
    }

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("Closing image modal")
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
