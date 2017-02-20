//
//  ComposeViewController.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/17/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import MBProgressHUD


class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var selectedImage: UIImageView!
    let imagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedImage.isHidden = true

        // Do any additional setup after loading the view.
        imagePicker.delegate = self

    }

    
    @IBAction func onImageSubmit(_ sender: Any) {
        print("Going to submit")
        // Display HUD right before the request is made
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Post.postUserImage(image: self.selectedImage.image, withCaption: self.caption.text) { (success: Bool, error: Error?) in
            if success{
                print("Submitted Picture!")
                MBProgressHUD.hide(for: self.view, animated: true)
                self.dismiss(animated: true, completion: nil)
            }else{
                print(error?.localizedDescription)
            }
        }
        print("Backgrounded~")

        
    }

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("Closing image modal")
    }
    
    @IBAction func loadImageButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Get the image captured by the UIImagePickerController
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Do something with the images (based on your use case)
            print("found image")
            selectedImage.contentMode = .scaleAspectFit
            selectedImage.image = originalImage
            self.selectedImage.isHidden = false
        }
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
